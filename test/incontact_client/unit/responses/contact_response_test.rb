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
          "result_set" => {
            "business_unit_id" => 0,
            "last_poll_time"   => "2017-04-21T18=>17=>16.519Z",
            "active_contacts"  => [
              {
                "agent_id"                => 0,
                "campaign_id"             => 0,
                "campaign_name"           => "string",
                "contact_id"              => 0,
                "contact_start"           => "2017-04-21T18=>17=>16.519Z",
                "file_name"               => "string",
                "first_name"              => "string",
                "from_addr"               => "string",
                "is_logged"               => true,
                "is_outbound"             => true,
                "is_takeover"             => true,
                "last_name"               => "string",
                "last_update_time"        => "2017-04-21T18=>17=>16.519Z",
                "master_contact_id"       => 0,
                "media_type"              => 0,
                "media_type_name"         => "string",
                "point_of_contact_id"     => 0,
                "point_of_contact_name"   => "string",
                "skill_id"                => 0,
                "skill_name"              => "string",
                "state"                   => "string",
                "state_id"                => 0,
                "targetAgent_id"          => 0,
                "team_id"                 => 0,
                "team_name"               => "string",
                "to_addr"                 => "string",
                "transfer_indicator_id"   => "0",
                "transfer_indicator_name" => "None"
              }
            ]
          }
        }
      end
    end
  end
end
