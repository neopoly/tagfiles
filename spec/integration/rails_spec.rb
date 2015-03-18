require "spec_helper"

ENV["RACK_ENV"] = "test"

require_relative "rails_app"

describe "Rails app" do
  include Rack::Test::Methods

  def app
    RailsApp
  end

  it "works" do
    get "/hello/world"

    assert_equal "Hello world!", last_response.body
  end
end
