module InContact
  module Responses
    class DispositionResponse < OpenStruct
      def dispositions
        @dispositions ||= self["result_set"]["dispositions"].map do |disposition|
          InContact::Models::Disposition.new(disposition)
        end
      end
    end
  end
end

