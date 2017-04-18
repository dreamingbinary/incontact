require "active_support/all"
require "retryable"
require "faraday"
require "faraday_middleware"
require "hashie"
require "incontact_client/error"
require "incontact_client/version"

module InContactClient
  autoload :Tokens, "incontact_client/tokens"
  autoload :Connection, "incontact_client/connection"

  module Models
    autoload :Token, "incontact_client/models/token"
  end
end
