module InContactClient
  module Responses
    class ContactResponse < Hashie::Mash
      def active_contacts
        @active_contacts ||= self["resultSet"]["activeContacts"].map do |contact|
          InContactClient::Models::Contact.new(contact)
        end
      end
    end
  end
end
