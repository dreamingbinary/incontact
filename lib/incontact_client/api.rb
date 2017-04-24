module InContactClient
  class Api
    attr_reader :token

    def initialize
      puts "SETTING UP!"
      @token = InContactClient::Tokens.get
    end

    def agents
      @agents ||= create_resource(InContactClient::Resources::AGENTS)
    end

    def contacts
      @contacts ||= create_resource(InContactClient::Resources::CONTACTS)
    end

    def agent_sessions
      @agent_sessions ||=  create_resource(InContactClient::Resources::AGENT_SESSIONS)
    end

    private

    def create_resource(resource)
      resource_class = "InContactClient::#{resource}".constantize
      data_model     = "InContactClient::Responses::#{resource.singularize}Response".constantize
      connection     = create_connection(data_model)

      resource_class.new(connection)
    end

    def create_connection(data_model)
      url           = token.resource_server_base_uri
      authorization = token.authorization
      options       = { default_data_model: data_model }

      InContactClient::Connection.new(url, authorization, options)
    end
  end
end
