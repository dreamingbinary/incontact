module InContactClient
  module Responses
    class AgentResponse < Hashie::Mash
      def agents
        @agents ||= self["agents"].map do |agent|
          InContactClient::Models::Agent.new(agent)
        end
      end
    end
  end
end
