require "spec_helper"

ENV["RACK_ENV"] = "test"

require_relative "rails_app"

describe RailsApp do
  it "works" do
    get "/hello_world"
    assert_equal "Hello world!\n", last_response.body
  end
end
