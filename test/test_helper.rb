require "bundler" ; Bundler.require :development, :test
require "incontact"
require "minitest/autorun"
require "minitest/pride"
require "dotenv"
require "webmock/minitest"

Dotenv.load ".env.test", ".env.local", ".env"

module InContact
  class TestCase < MiniTest::Spec
    TEST_URL = "http://example.com/incontact"

    def mock_request(type, status, options = {})
      base_url      = options[:base_url] || TEST_URL
      request_body  = options[:request_body]
      response_file = options[:response_file]
      path          = options[:path]
      url = path.blank? ? base_url : "#{base_url}/#{InContact::Connection::API_PATH_PREFIX}#{path}"

      header_options = {"User-Agent" => /.*/ }
      response_body = response_file ? File.new("test/incontact/fixtures/#{response_file}.json") : ""
      request_body = request_body ? request_body.to_json : ""
      
      stub_request(type, url).with(headers: header_options, body: request_body).
        to_return(status: status, body: response_body)
    end
  end
end
