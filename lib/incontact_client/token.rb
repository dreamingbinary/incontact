require "base64"

module InContactClient
  class Token < Connection
    class << self

      def get
        post("", token_request_data)
      end

      private

      def token_request_data
        {
          grant_type: "password",
          username:   ENV["INCONTACT_USERNAME"],
          password:   ENV["INCONTACT_PASSWORD"],
          scope:      ENV["INCONTACT_SCOPE"]
        }
      end

      def authorization
        "basic #{encoded_auth_string}"
      end

      def auth_string
        "#{ENV["INCONTACT_APP_NAME"]}@#{ENV["INCONTACT_VENDOR_NAME"]}:#{ENV["INCONTACT_BUSINESS_UNIT_NUMBER"]}"
      end

      def encoded_auth_string
        Base64.encode64(auth_string).chomp
      end

      def url
        ENV["INCONTACT_TOKEN_URL"]
      end
    end
  end
end
