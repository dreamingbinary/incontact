module InContactClient
  class TokensTest < TestCase
    describe ".get" do
      it "will return a token" do
        body = {
          grant_type: "password",
          username:   ENV["INCONTACT_USERNAME"],
          password:   ENV["INCONTACT_PASSWORD"],
          scope:      ENV["INCONTACT_SCOPE"]
        }
        mock_request(:post, ENV["INCONTACT_TOKEN_URL"], 200, "token", body)
        token = InContactClient::Tokens.get
        token.must_be_kind_of InContactClient::Models::Token
      end
    end
  end
end