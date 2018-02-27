module InContact
  module Models
    class Token < OpenStruct
      def authorization
        "#{token_type} #{access_token}"
      end
    end
  end
end
