module InContact
  class Api
    attr_reader :token

    def initialize
      @token = InContact::Tokens.get
    end

    def agents
      @agents ||= create_resource(InContact::Resources::AGENTS)
    end

    def contacts
      @contacts ||= create_resource(InContact::Resources::CONTACTS)
    end

    def agent_sessions
      @agent_sessions ||=  create_resource(InContact::Resources::AGENT_SESSIONS)
    end

    def call_lists
      @call_lists ||=  create_resource(InContact::Resources::CALL_LISTS)
    end

    private

    def create_resource(resource)
      resource_model = "InContact::#{resource}".constantize
      data_model     = "InContact::Responses::#{resource.singularize}Response".constantize
      connection     = create_connection(data_model)

      resource_model.new(connection)
    end

    def create_connection(data_model)
      url           = token.resource_server_base_uri
      authorization = token.authorization
      options       = { default_data_model: data_model }

      InContact::Connection.new(url, authorization, options)
    end
  end
end
