require "bundler"
Bundler.require

require "minitest/autorun"
require "rack/test"

class IntegrationSpec < Minitest::Spec
  include Rack::Test::Methods

  def app
    RailsApp
  end
end

MiniTest::Spec.register_spec_type("RailsApp", IntegrationSpec)
