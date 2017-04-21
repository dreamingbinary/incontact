module InContactClient
  module Responses
    class ContactResponseTest < TestCase
      let(:contact_response) { InContactClient::Responses::ContactResponse.new(response_params) }

      describe "#active_contacts" do
        it "will return an array of contact models" do
          contacts = contact_response.active_contacts
          contacts.count.must_equal 1
          contacts.first.must_be_kind_of InContactClient::Models::Contact
        end
      end

      private

      def response_params
        {
          "resultSet" => {
            "businessUnitId" => 0,
            "lastPollTime"   => "2017-04-21T18=>17=>16.519Z",
            "activeContacts" => [
              {
                "agentId"               => 0,
                "campaignId"            => 0,
                "campaignName"          => "string",
                "contactId"             => 0,
                "contactStart"          => "2017-04-21T18=>17=>16.519Z",
                "fileName"              => "string",
                "firstName"             => "string",
                "fromAddr"              => "string",
                "isLogged"              => true,
                "isOutbound"            => true,
                "isTakeover"            => true,
                "lastName"              => "string",
                "lastUpdateTime"        => "2017-04-21T18=>17=>16.519Z",
                "masterContactId"       => 0,
                "mediaType"             => 0,
                "mediaTypeName"         => "string",
                "pointOfContactId"      => 0,
                "pointOfContactName"    => "string",
                "skillId"               => 0,
                "skillName"             => "string",
                "state"                 => "string",
                "stateId"               => 0,
                "targetAgentId"         => 0,
                "teamId"                => 0,
                "teamName"              => "string",
                "toAddr"                => "string",
                "transferIndicatorId"   => "0",
                "transferIndicatorName" => "None"
              }
            ]
          }
        }
      end
    end
  end
end
