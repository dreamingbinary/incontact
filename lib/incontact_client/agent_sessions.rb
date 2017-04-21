module InContactClient
  class AgentSessions < TokenAuthenticatedResource
    class << self
      def join_agent_session(token, agent_id)
        url = build_url(token, "/services/v8.0/agent-sessions/join")
        agent_request_data = {
          "asAgentId" => agent_id
        }
        post(url, token.authorization, agent_request_data)
      end

      def mask_call(token, session_id, contact_id)
        path = "/services/v8.0/agent-sessions/#{session_id}/interactions/#{contact_id}/mask"
        url = build_url(token, path)
        post(url, token.authorization)
      end

      def unmask_call(token, session_id, contact_id)
        path = "/services/v8.0/agent-sessions/#{session_id}/interactions/#{contact_id}/unmask"
        url = build_url(token, path)
        post(url, token.authorization)
      end
    end
  end
end
