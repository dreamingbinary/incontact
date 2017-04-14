require "retryable"
require "faraday"
require "faraday_middleware"
require "hashie"
require "incontact_client/error"
require "incontact_client/version"

module InContactClient
  autoload :Token, "incontact_client/token"
  autoload :Connection, "incontact_client/connection"
end
