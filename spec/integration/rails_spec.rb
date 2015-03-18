require "spec_helper"

ENV["RACK_ENV"] = "test"

require_relative "rails_app"

class TestController < ActionController::Base
  def simple_alias
    render inline: "<%= tagfile :simple %>"
  end

  def simple
    render inline: "<%= tf :simple %>"
  end

  def simple_with_params
    render inline: "<%= tf :simple, param: params[:param] %>"
  end

  def block
    render inline: "<%= tf :simple do %>content<% end %>"
  end

  def block_with_params
    render inline: "<%= tf :simple, param: params[:param] do %>content<% end %>"
  end

  def inner
    render inline: "<%= tf :inner %>"
  end
end

module Namespaced
  class TestController < ActionController::Base
    def inner
      render inline: "<%= tf :inner %>"
    end

    def outer
      render inline: "<%= tf :outer %>"
    end
  end
end

describe RailsApp do
  describe "w/o block" do
    it "renders partial from tagfiles/ w/o params aliased" do
      get "/test/simple_alias"
      assert_body %(simple[{:simple=>nil}]())
    end

    it "renders partial from tagfiles/ w/o params" do
      get "/test/simple"
      assert_body %(simple[{:simple=>nil}]())
    end

    it "renders partial from tagfiles/ with params" do
      get "/test/simple_with_params", param: "foo"
      assert_body %(simple[{:param=>"foo", :simple=>nil}]())
    end
  end

  describe "with block" do
    it "renders layout from tagfiles/ w/o params" do
      get "/test/block"
      assert_body %(simple[{:simple=>nil}](content))
    end

    it "renders layout from tagfiles/ with params" do
      get "/test/block_with_params", param: "foo"
      assert_body %(simple[{:param=>"foo", :simple=>nil}](content))
    end
  end

  describe "inner tagfile" do
    it "prefers inner tagfile in test/tagfiles/" do
      get "/test/inner"
      assert_body %(inner)
    end

    it "renders most inner tagfile in namespaced/test/tagfiles" do
      get "/namespaced/test/inner"
      assert_body %(most inner)
    end

    it "renders outer tagfile in namespaced/tagfiles" do
      get "/namespaced/test/outer"
      assert_body %(outer)
    end
  end
end
