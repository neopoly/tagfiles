require "spec_helper"

ENV["RACK_ENV"] = "test"

require_relative "rails_app"

class TestController < ActionController::Base
  def simple
  end
end

describe RailsApp do
  describe "w/o block" do
    it "renders plain partial from tagfiles/" do
      get "/simple"
      assert_body "Simple"
    end
  end
end
