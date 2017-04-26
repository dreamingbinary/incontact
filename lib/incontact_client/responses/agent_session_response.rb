module InContactClient
  module Responses
    class AgentSessionResponse < OpenStruct
      def session_id
        @session_id ||= self["sessionId"]
      end
    end
  end
end
