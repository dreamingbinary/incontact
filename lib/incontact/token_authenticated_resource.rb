module InContact
  class TokenAuthenticatedResource

    attr_reader :connection

    def initialize(connection)
      @connection = connection
    end
  end
end
