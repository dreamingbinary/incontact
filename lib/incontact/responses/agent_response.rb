module InContact
  module Responses
    class AgentResponse < OpenStruct
      def agents
        @agents ||= self["agents"].map do |agent|
          InContact::Models::Agent.new(agent)
        end
      end
    end
  end
end
