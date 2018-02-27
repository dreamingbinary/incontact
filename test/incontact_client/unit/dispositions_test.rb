module InContactClient
  class DispositionsTest < TestCase
    let(:connection) do
      InContactClient::Connection.new(TEST_URL, "bearer 1234",
        { default_data_model: InContactClient::Responses::DispositionResponse } )
    end

    let(:dispositions) { InContactClient::Dispositions.new(connection) }

    describe "#all" do
      before do
        options = { path: "dispositions", response_file: "all_dispositions" }
        mock_request(:get, 200, options)
        @response = dispositions.all
      end

      it "will return a ContactResponse" do
        @response.must_be_kind_of(InContactClient::Responses::DispositionResponse)
      end
    end
  end
end

