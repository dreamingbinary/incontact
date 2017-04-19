require "active_support/all"
require "retryable"
require "faraday"
require "faraday_middleware"
require "hashie"
require "incontact_client/error"
require "incontact_client/version"

module InContactClient
  autoload :Tokens,                     "incontact_client/tokens"
  autoload :Connection,                 "incontact_client/connection"
  autoload :TokenAuthenticatedResource, "incontact_client/token_authenticated_resource"
  autoload :Agents,                     "incontact_client/agents"
  autoload :Contacts,                   "incontact_client/contacts"

  module Models
    autoload :Token, "incontact_client/models/token"
    autoload :Agent, "incontact_client/models/agent"
    autoload :Contact, "incontact_client/models/agent"
  end
end
