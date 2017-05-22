module InContactClient
  module Responses
    class ContactResponse < OpenStruct
      def active_contacts
        @active_contacts ||= self["result_set"]["active_contacts"].map do |contact|
          InContactClient::Models::Contact.new(contact)
        end
      end
    end
  end
end
