require "bundler" ; Bundler.require :development, :test
require "incontact_client"
require "minitest/autorun"
require "minitest/pride"
require "dotenv"
require "webmock/minitest"

Dotenv.load ".env.test", ".env.local", ".env"

module InContactClient
  class TestCase < MiniTest::Spec
    def mock_request(type, url, status, response_file = nil)
      header_options = {"User-Agent" => /.*/ }
      body = response_file ? File.new("test/incontact_client/fixtures/#{response_file}.json") : ""
      
      stub_request(:get, url).with(headers: header_options).
        to_return(status: status, body: body)
    end
  end
end
