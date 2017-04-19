module InContactClient
  class Agents < TokenAuthenticatedResource
    class << self
      def all(token)
        url = build_url(token, "/services/v8.0/agents")
        get(url, token.authorization)
      end

      def find(id, token)
        url = build_url(token, "/services/v8.0/agents/#{id}")
        get(url, token.authorization)
      end
    end
  end
end
