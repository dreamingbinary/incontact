module InContactClient
  class ContactsTest < TestCase
    let(:token) do
      InContactClient::Models::Token.new(token_type: "bearer",
        access_token: "1234567", resource_server_base_uri: "http://example.com/incontact")
    end

    describe ".active" do
      before do
        path = "services/v8.0/contacts/active"
        host = token.resource_server_base_uri
        url = "#{host}/#{path}"
        mock_request(:get, url, 200, "active_contacts")
        @contact_response = InContactClient::Contacts.active(token)
      end

      it "will return a ContactResponse" do
        @contact_response.must_be_kind_of InContactClient::Responses::ContactResponse
      end
    end
  end
end
