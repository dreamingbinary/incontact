module InContactClient
  module Models
    class Token < Hashie::Mash
      def authorization
        "#{token_type} #{access_token}"
      end
    end
  end
end
