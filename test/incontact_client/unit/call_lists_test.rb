module InContactClient
  class CallListsTest < TestCase
    let(:connection) do
      InContactClient::Connection.new(TEST_URL, "bearer 1234",
        { default_data_model: InContactClient::Responses::CallListResponse } )
    end

    let(:call_lists) { InContactClient::CallLists.new(connection) }

     describe "#find" do
      before do
        options = { path: "lists/call-lists/2682904", response_file: "one_call_list" }
        mock_request(:get, 200, options)
        @response = call_lists.find(2682904)
      end

      it "will return an CallListResponse" do
        @response.must_be_kind_of(InContactClient::Responses::CallListResponse)
      end

      it "will return an call list" do
        @response.calling_lists.count.must_equal(1)
      end
    end

    describe "#all" do
      before do
        options = { path: "lists/call-lists", response_file: "all_call_lists"}
        mock_request(:get, 200, options)
        @response = call_lists.all
      end

      it "will return all the CallLists" do
        @response.calling_lists.count.must_equal(2)
      end

      it "will return an CallListResponse" do
        @response.must_be_kind_of(InContactClient::Responses::CallListResponse)
      end
    end

    describe "#upload_file" do
      before do
        file_content = File.read("test/incontact_client/fixtures/valid_call_list.csv")
        path = "lists/call-lists/1234/upload"
        body = {
          "listId"   => 1234,
          "listFile" => Base64.encode64(file_content),
          "skillId"  => 234554
        }
        options = { request_body: body, response_file: "upload_call_list", path: path }
        mock_request(:post, 202, options)
        @response = call_lists.upload_file(1234, body)
      end

      it "will return an CallListResponse" do
        @response.must_be_kind_of(InContactClient::Responses::CallListResponse)
      end
    end

    describe "#create" do
      before do
        path = "lists/call-lists"
        body = {
          listName: "Leads",
          externalIdColumn: "salesforce_id",
          destinationMappings: [
            {
              fieldName: "phoneNumber",
              fieldValue: "phone_1"
            }
          ],
          firstNameColumn: "first_name",
          lastNameColumn: "last_name"
        }
        options = { request_body: body, response_file: "create_call_list", path: path }
        mock_request(:post, 201, options)
        @response = call_lists.create(body)
      end

      it "will return a list id" do
        @response.list_id.must_equal(234)
      end
    end
  end
end
