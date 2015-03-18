require "bundler"
Bundler.require

if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require "minitest/autorun"
require "rack/test"

class IntegrationSpec < Minitest::Spec
  include Rack::Test::Methods

  def app
    RailsApp
  end

  def assert_body(expected)
    assert_equal expected, last_response.body.strip
  end
end

MiniTest::Spec.register_spec_type("RailsApp", IntegrationSpec)
