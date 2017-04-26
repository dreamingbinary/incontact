module InContactClient
  class Connection
    TIMEOUT         = 60
    OPEN_TIMEOUT    = 10
    MAX_TRIES       = 2
    RETRY_SLEEP     = 1
    API_PATH_PREFIX = "services/v8.0/"

    attr_reader :url
    attr_reader :authorization
    attr_reader :default_data_model

    def initialize(url, authorization, options = {})
      @url                = url
      @authorization      = authorization
      @default_data_model = options[:default_data_model] || OpenStruct
    end

    def get(path, params = {})
      request :get, path, params
    end

    def post(path, payload = "", params = {})
      request :post, path, params, payload
    end

    def request(type, path, params = {}, body=nil)
      timeout_override      = params.delete :timeout
      open_timeout_override = params.delete :open_timeout
      data_model_override   = params.delete :data_model_override
      response              = Retryable.retryable(retryable_options(params)) do
        request_with_exception_handling do
          connection.send(type) do |req|
            req.path                   = API_PATH_PREFIX + path unless path.blank?
            req.options[:timeout]      = timeout_override      || TIMEOUT
            req.options[:open_timeout] = open_timeout_override || OPEN_TIMEOUT
            req.params                 = params
            req.body                   = body.to_json unless body.blank?
          end
        end
      end
      raise_response_errors(response)
      parse_response(response, data_model_override)
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
      @connection ||= create_connection
    end

    def create_connection
      Faraday.new(url: url) do |faraday|
        faraday.headers["Accept-Encoding"] = "none"
        faraday.headers["Content-Type"]    = "application/json; charset=utf-8"
        faraday.headers["Authorization"]   = authorization
        faraday.use FaradayMiddleware::ParseJson
        faraday.adapter Faraday.default_adapter
      end
    end

    def parse_response(response, data_model_override)
      data = response.body
      map_response_item_to_model(data, data_model_override)
    end

    def data_model(item)
      klass = name.demodulize.underscore.singularize.classify
      "InContactClient::Responses::#{klass}Response".constantize rescue nil
    end

    def map_response_item_to_model(item, data_model_override)
      return item if item.blank? || data_model_override.is_a?(FalseClass)
      data_model_klass = data_model_override || default_data_model
      return item if data_model_klass.nil?
      data_model_klass.new(item)
    end
  end
end
