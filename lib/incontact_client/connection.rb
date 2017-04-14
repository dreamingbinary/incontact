module InContactClient
  class Connection
    TIMEOUT      = 60
    OPEN_TIMEOUT = 10
    MAX_TRIES    = 2
    RETRY_SLEEP  = 1

    attr_reader :url, :authorization

    def initialize(url, authorization)
      @url           = url
      @authorization = authorization
    end

    def get(path, params = {})
      request :get, path, params
    end

    def post(path, payload, params = {})
      request :post, path, params, payload
    end

    def request(type, path, params = {}, body=nil)
      timeout_override      = params.delete :timeout
      open_timeout_override = params.delete :open_timeout
      response              = Retryable.retryable(retryable_options(params)) do
        request_with_exception_handling do
          connection.send(type) do |req|
            req.path                   = path
            req.options[:timeout]      = timeout_override      || TIMEOUT
            req.options[:open_timeout] = open_timeout_override || OPEN_TIMEOUT
            req.params                 = params
            req.body                   = body.to_json if body
          end
        end
      end
      raise_response_errors(response)
      response.body
    end

    private

    def retryable_options(options)
      {}.tap do |retry_options|
        retry_options[:tries] = options.delete(:max_tries)   || MAX_TRIES
        retry_options[:sleep] = options.delete(:retry_sleep) || RETRY_SLEEP
        retry_options[:on]    = [ConnectionError]
      end
    end

    def request_with_exception_handling
      yield
    rescue => exception
      raise ConnectionError, exception
    end

    def raise_response_errors(response)
      return if response.success?
      error_messages = response.body.respond_to?(:exception_message) &&
        response.body.errors.present? ? response.body.errors.join("\n") : ""
      case response.status
      when 404
        raise ResourceNotFound.new(error_messages, response)
      when 400...600
        raise Error.new(error_messages, response)
      end
    end

    def connection
      @connection ||= Faraday.new do |faraday|
        faraday.url_prefix                 = url
        faraday.headers["Accept-Encoding"] = "none"
        faraday.headers["Content-Type"]    = "application/json; charset=utf-8"
        faraday.headers["Authorization"]   = authorization
        faraday.use FaradayMiddleware::Mashify
        faraday.use FaradayMiddleware::ParseJson
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
