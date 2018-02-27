module InContact
  class ContactsTest < TestCase
    let(:connection) do
      InContact::Connection.new(TEST_URL, "bearer 1234",
        { default_data_model: InContact::Responses::ContactResponse } )
    end

    let(:contacts) { InContact::Contacts.new(connection) }

    describe ".active" do
      before do
        options = { path: "contacts/active", response_file: "active_contacts" }
        mock_request(:get, 200, options)
        @contact_response = contacts.active
      end

      it "will return a ContactResponse" do
        @contact_response.must_be_kind_of InContact::Responses::ContactResponse
      end
    end
  end
end
