module InContactClient
  class ContactsTest < TestCase
    let(:connection) do
      InContactClient::Connection.new(TEST_URL, "bearer 1234",
        { default_data_model: InContactClient::Responses::ContactResponse } )
    end

    let(:contacts) { InContactClient::Contacts.new(connection) }

    describe ".active" do
      before do
        options = { path: "contacts/active", response_file: "active_contacts" }
        mock_request(:get, 200, options)
        @contact_response = contacts.active
      end

      it "will return a ContactResponse" do
        @contact_response.must_be_kind_of InContactClient::Responses::ContactResponse
      end
    end
  end
end
