require "active_support/all"
require "retryable"
require "faraday"
require "faraday_middleware"
require "incontact_client/error"
require "incontact_client/version"
require "ostruct"

module InContactClient
  autoload :Api,                        "incontact_client/api"
  autoload :Tokens,                     "incontact_client/tokens"
  autoload :Connection,                 "incontact_client/connection"
  autoload :TokenAuthenticatedResource, "incontact_client/token_authenticated_resource"
  autoload :Agents,                     "incontact_client/agents"
  autoload :Contacts,                   "incontact_client/contacts"
  autoload :AgentSessions,              "incontact_client/agent_sessions"
  autoload :CallLists,                  "incontact_client/call_lists"
  autoload :Resources,                  "incontact_client/resources"

  module Models
    autoload :Token,        "incontact_client/models/token"
    autoload :Agent,        "incontact_client/models/agent"
    autoload :Contact,      "incontact_client/models/contact"
    autoload :AgentSession, "incontact_client/models/agent_session"
    autoload :CallList,     "incontact_client/models/call_list"
  end

  module Responses
    autoload :ContactResponse,      "incontact_client/responses/contact_response"
    autoload :AgentResponse,        "incontact_client/responses/agent_response"
    autoload :AgentSessionResponse, "incontact_client/responses/agent_session_response"
    autoload :CallListResponse,     "incontact_client/responses/call_list_response"
  end
end
