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
        options = { path: "agents", response_file: "all_agents"}
        mock_request(:get, 200, options)
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
        options = { path: "agents/2682904", response_file: "one_agent" }
        mock_request(:get, 200, options)
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
