module InContact
  class TokensTest < TestCase
    describe ".get" do
      it "will return a token" do
        body = {
          grant_type: "password",
          username:   ENV["INCONTACT_USERNAME"],
          password:   ENV["INCONTACT_PASSWORD"],
          scope:      ENV["INCONTACT_SCOPE"]
        }
        options = { request_body: body, base_url: ENV["INCONTACT_TOKEN_URL"], response_file: "token" }
        mock_request(:post, 200, options)
        token = InContact::Tokens.get
        token.must_be_kind_of InContact::Models::Token
      end
    end
  end
end
