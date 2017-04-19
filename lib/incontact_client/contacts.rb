module InContactClient
  class Contacts < TokenAuthenticatedResource
    class << self
      def active(token)
        url = build_url(token, "/services/v8.0/contacts/active")
        get(url, token.authorization)
      end
    end
  end
end
