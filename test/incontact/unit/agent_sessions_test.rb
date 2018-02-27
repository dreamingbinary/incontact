require "test_helper"

module InContact
  class AgentSessionsTest < TestCase
    let(:connection) do
      InContact::Connection.new(TEST_URL, "bearer 1234",
        { default_data_model: InContact::Responses::AgentSessionResponse } )
    end

    let(:agent_session) do
      InContact::AgentSessions.new(connection)
    end

    describe ".join_agent_session" do
      before do
        path = "agent-sessions/join"
        body = { "asAgentId" => 1234 }
        options = { request_body: body, response_file: "join_session", path: path }
        mock_request(:post, 202, options)
        @agent_session_response = agent_session.join_agent_session(1234)
      end

      it "will return an AgentSessionResponse" do
        @agent_session_response.must_be_kind_of InContact::Responses::AgentSessionResponse
      end

      it "will return the session_id" do
        @agent_session_response["session_id"].must_equal "1234"
      end
    end

    describe ".mask_call" do
      before do
        path = "agent-sessions/1234/interactions/1234/mask"
        mock_request(:post, 202, path: path)
        @agent_session_response = agent_session.mask_call(1234, 1234)
      end

      it "will return nothing" do
        @agent_session_response.must_be_nil
      end
    end

    describe ".unmask_call" do
      before do
        path = "agent-sessions/1234/interactions/1234/unmask"
        mock_request(:post, 202, path: path)
        @agent_session_response = agent_session.unmask_call(1234, 1234)
      end

      it "will return nothing" do
        @agent_session_response.must_be_nil
      end
    end
  end
end
