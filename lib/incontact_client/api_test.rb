module InContactClient
  class ApiTest < TestCase
    before do
      mock_request(:post, "", 200, "token", body, ENV["INCONTACT_TOKEN_URL"])
    end

    let(:api) { InContactClient::Api.new }

    it "will get a token on initialization" do
      api.token.wont_be_nil
    end

    describe "#agents" do
      it "will return an agent resource class" do
        api.agents.must_be_kind_of InContactClient::Agents
      end
    end

    describe "#agent_sessions" do
      it "will return an agent session resource class" do
        api.agents.must_be_kind_of InContactClient::AgentSessions
      end
    end

    describe "#agents" do
      it "will return a contact resource class" do
        api.agents.must_be_kind_of InContactClient::Contacts
      end
    end
  end
end
