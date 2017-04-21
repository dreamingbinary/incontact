require "test_helper"

module InContactClient
  class AgentsTest < TestCase
    let(:token) do
      InContactClient::Models::Token.new(token_type: "bearer",
        access_token: "1234567", resource_server_base_uri: "http://example.com/incontact")
    end
    
    describe ".all" do
      before do
        path = "services/v8.0/agents"
        host = token.resource_server_base_uri
        url = "#{host}/#{path}"
        mock_request(:get, url, 200, "all_agents")
        @agent_response = InContactClient::Agents.all(token)
      end

      it "will return all the agents" do
        @agent_response.agents.count.must_equal 2
      end

      it "will return an AgentResponse" do
        @agent_response.must_be_kind_of InContactClient::Responses::AgentResponse
      end
    end

    describe ".find" do
      before do
        path = "services/v8.0/agents/1234"
        host = token.resource_server_base_uri
        url = "#{host}/#{path}"
        mock_request(:get, url, 200, "one_agent")
        @agent_response = InContactClient::Agents.all(token)
      end

      it "will return an AgentResponse" do
        @agent_response.must_be_kind_of InContactClient::Responses::AgentResponse
      end

      it "will return an agent" do
        @agent_response.agents.count.must_equal 1
      end
    end
  end
end
