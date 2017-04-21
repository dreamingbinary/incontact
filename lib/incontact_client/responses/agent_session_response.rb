module InContactClient
  module Responses
    class AgentSessionResponse < Hashie::Mash
      def session_id
        @session_id ||= self["sessionId"]
      end
    end
  end
end
