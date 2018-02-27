require "active_support/all"
require "retryable"
require "faraday"
require "faraday_middleware"
require "incontact/error"
require "incontact/version"
require "ostruct"

module InContact
  autoload :Api,                        "incontact/api"
  autoload :Tokens,                     "incontact/tokens"
  autoload :Connection,                 "incontact/connection"
  autoload :TokenAuthenticatedResource, "incontact/token_authenticated_resource"
  autoload :Agents,                     "incontact/agents"
  autoload :Contacts,                   "incontact/contacts"
  autoload :AgentSessions,              "incontact/agent_sessions"
  autoload :CallLists,                  "incontact/call_lists"
  autoload :Dispositions,               "incontact/dispositions"
  autoload :Resources,                  "incontact/resources"

  module Models
    autoload :Token,        "incontact/models/token"
    autoload :Agent,        "incontact/models/agent"
    autoload :Contact,      "incontact/models/contact"
    autoload :AgentSession, "incontact/models/agent_session"
    autoload :CallList,     "incontact/models/call_list"
    autoload :Disposition,  "incontact/models/disposition"
  end

  module Responses
    autoload :ContactResponse,      "incontact/responses/contact_response"
    autoload :AgentResponse,        "incontact/responses/agent_response"
    autoload :AgentSessionResponse, "incontact/responses/agent_session_response"
    autoload :CallListResponse,     "incontact/responses/call_list_response"
    autoload :CallListResponse,     "incontact/responses/call_list_response"
    autoload :DispositionResponse,   "incontact/responses/disposition_response"
  end
end
