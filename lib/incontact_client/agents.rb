module InContactClient
  class Agents < TokenAuthenticatedResource
    def all
      connection.get("agents")
    end

    def find(id)
      connection.get("agents/#{id}")
    end
  end
end
