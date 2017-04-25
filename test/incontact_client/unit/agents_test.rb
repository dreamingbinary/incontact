require "test_helper"

module InContactClient
  class AgentsTest < TestCase
    let(:connection) do
      InContactClient::Connection.new(TEST_URL, "bearer 1234",
        { default_data_model: InContactClient::Responses::AgentResponse } )
    end

    let(:agent) { InContactClient::Agents.new(connection) }
    
    describe ".all" do
      before do
        path = "services/v8.0/agents"
        mock_request(:get, path, 200, "all_agents")
        @agent_response = agent.all
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
        path = "services/v8.0/agents/2682904"
        mock_request(:get, path, 200, "one_agent")
        @agent_response = agent.find(2682904)
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
