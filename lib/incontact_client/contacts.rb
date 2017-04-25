module InContactClient
  class Contacts < TokenAuthenticatedResource
    def active
      connection.get("contacts/active")
    end
  end
end
