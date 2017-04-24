module InContactClient
  class Agents < TokenAuthenticatedResource
    def all
      connection.get("services/v8.0/agents")
    end

    def find(id)
      connection.get("services/v8.0/agents/#{id}")
    end
  end
end
