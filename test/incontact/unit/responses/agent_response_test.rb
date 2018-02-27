module InContact
  module Responses
    class AgentResponseTest < TestCase
      let(:agent_response) { InContact::Responses::AgentResponse.new(response_params) }

      describe "#agents" do
        it "will return an Array of Agent models" do
          agents = agent_response.agents
          agents.count.must_equal 1
          agents.first.must_be_kind_of InContact::Models::Agent
        end
      end

      private

      def response_params
        {
          "businessUnitId" => 1234567,
          "lastPollTime"   => "2017-04-21T18=>12=>32.120Z",
          "agents"         => [
            {
              "agentId"      => 2682904,
              "userName"     => "test1@example.com",
              "firstName"    => "Test",
              "middleName"   => "",
              "lastName"     => "One",
              "emailAddress" => "test1@example.com",
              "isActive"     => true,
            }
          ]
        }
      end
    end
  end
end
