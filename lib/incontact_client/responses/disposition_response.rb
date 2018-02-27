module InContactClient
  module Responses
    class DispositionResponse < OpenStruct
      def dispositions
        @dispositions ||= self["result_set"]["dispositions"].map do |disposition|
          InContactClient::Models::Disposition.new(disposition)
        end
      end
    end
  end
end

