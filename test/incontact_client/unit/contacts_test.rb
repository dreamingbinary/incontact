module InContactClient
  class ContactsTest < TestCase
    let(:connection) do
      InContactClient::Connection.new(TEST_URL, "bearer 1234",
        { default_data_model: InContactClient::Responses::ContactResponse } )
    end

    let(:contacts) { InContactClient::Contacts.new(connection) }

    describe ".active" do
      before do
        path = "services/v8.0/contacts/active"
        mock_request(:get, path, 200, "active_contacts")
        @contact_response = contacts.active
      end

      it "will return a ContactResponse" do
        @contact_response.must_be_kind_of InContactClient::Responses::ContactResponse
      end
    end
  end
end
