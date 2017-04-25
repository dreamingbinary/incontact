module InContactClient
  class AgentSessions < TokenAuthenticatedResource
    def join_agent_session(agent_id)
      agent_request_data = { "asAgentId" => agent_id }
      connection.post("agent-sessions/join", agent_request_data)
    end

    def mask_call(session_id, contact_id)
      connection.post("agent-sessions/#{session_id}/interactions/#{contact_id}/mask")
    end

    def unmask_call(session_id, contact_id)
      connection.post("agent-sessions/#{session_id}/interactions/#{contact_id}/unmask")
    end
  end
end
