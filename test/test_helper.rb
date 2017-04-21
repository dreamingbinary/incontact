require "bundler" ; Bundler.require :development, :test
require "incontact_client"
require "minitest/autorun"
require "minitest/pride"
require "dotenv"
require "webmock/minitest"

Dotenv.load ".env.test", ".env.local", ".env"

module InContactClient
  class TestCase < MiniTest::Spec
    def mock_request(type, url, status, response_file = nil, request_body = nil)
      header_options = {"User-Agent" => /.*/ }
      response_body = response_file ? File.new("test/incontact_client/fixtures/#{response_file}.json") : ""
      request_body = request_body ? request_body.to_json : ""
      
      stub_request(type, url).with(headers: header_options, body: request_body).
        to_return(status: status, body: response_body)
    end
  end
end
