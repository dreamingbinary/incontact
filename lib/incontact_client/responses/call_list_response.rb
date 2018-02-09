module InContactClient
  module Responses
    class CallListResponse < OpenStruct
      def call_list
        @call_lists ||= self["callingLists"].map do |call_list|
          InContactClient::Models::CallList.new(call_list)
        end
      end
    end
  end
end
