module InContactClient
  class Error < StandardError
    attr_reader :response

    def initialize(exception, response = nil)
      @response = response
      if exception.instance_of? Faraday::Error::ClientError
        super exception.message
      elsif exception.is_a? String
        super exception
      else
        super "Unknown exception: #{exception.message}"
      end
    end
  end

  class ConnectionError < Error ; end
  class ResourceError < Error ; end
  class ResourceNotFound < ResourceError ; end
end
