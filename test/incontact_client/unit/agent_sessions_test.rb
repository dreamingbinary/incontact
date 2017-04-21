require "test_helper"

module InContactClient
  class AgentSessionsTest < TestCase
    let(:token) do
      InContactClient::Models::Token.new(token_type: "bearer",
        access_token: "1234567", resource_server_base_uri: "http://example.com/incontact")
    end

    describe ".join_agent_session" do
      before do
        path = "services/v8.0/agent-sessions/join"
        host = token.resource_server_base_uri
        url = "#{host}/#{path}"
        body = { "asAgentId" => 1234 }
        mock_request(:post, url, 202, "join_session", body)
        @agent_session_response = InContactClient::AgentSessions.join_agent_session(token, 1234)
      end

      it "will return an AgentSessionResponse" do
        @agent_session_response.must_be_kind_of InContactClient::Responses::AgentSessionResponse
      end

      it "will return the session_id" do
        @agent_session_response.sessionId.must_equal "1234"
      end
    end

    describe ".mask_call" do
      before do
        path = "services/v8.0/agent-sessions/1234/interactions/1234/mask"
        host = token.resource_server_base_uri
        url = "#{host}/#{path}"
        mock_request(:post, url, 202)
        @agent_session_response = InContactClient::AgentSessions.mask_call(token, 1234, 1234)
      end

      it "will return nothing" do
        @agent_session_response.must_be_nil
      end
    end

    describe ".unmask_call" do
      before do
        path = "services/v8.0/agent-sessions/1234/interactions/1234/unmask"
        host = token.resource_server_base_uri
        url = "#{host}/#{path}"
        mock_request(:post, url, 202)
        @agent_session_response = InContactClient::AgentSessions.unmask_call(token, 1234, 1234)
      end

      it "will return nothing" do
        @agent_session_response.must_be_nil
      end
    end
  end
end
