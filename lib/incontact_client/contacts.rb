module InContactClient
  class Contacts < TokenAuthenticatedResource
    def active
      connection.get("services/v8.0/contacts/active")
    end
  end
end
