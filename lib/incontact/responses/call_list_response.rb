module InContact
  module Responses
    class CallListResponse < OpenStruct
      def call_list
        @call_lists ||= self["callingLists"].map do |call_list|
          InContact::Models::CallList.new(call_list)
        end
      end
    end
  end
end
