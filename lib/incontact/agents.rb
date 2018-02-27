module InContact
  class Agents < TokenAuthenticatedResource
    def all
      connection.get("agents")
    end

    def find(agent_id)
      connection.get("agents/#{agent_id}")
    end
  end
end
