module InContactClient
  class TokenAuthenticatedResource < Connection
    class << self
      def build_url(token, path)
        token.resource_server_base_uri + path
      end
    end
  end
end
