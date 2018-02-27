module InContact
  module Responses
    class AgentSessionResponseTest < TestCase
      let(:agent_session_response) { InContact::Responses::AgentSessionResponse.new(response_params) }

      describe "#session_id" do
        it "will return the session_id" do
          agent_session_response.session_id.must_equal 1234
        end
      end

      private

      def response_params
        {
          "session_id" => 1234
        }
      end
    end
  end
end
