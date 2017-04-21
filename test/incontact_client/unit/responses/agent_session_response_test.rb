module InContactClient
  module Responses
    class AgentSessionResponseTest < TestCase
      let(:agent_session_response) { InContactClient::Responses::AgentSessionResponse.new(response_params) }

      describe "#session_id" do
        it "will return the sessionId" do
          agent_session_response.session_id.must_equal 1234
        end
      end

      private

      def response_params
        {
          "sessionId" => 1234
        }
      end
    end
  end
end
