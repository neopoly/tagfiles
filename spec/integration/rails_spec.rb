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

  def missing
    render inline: "<%= tf :missing %>"
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

    def simple
      render inline: "<%= tf :simple %>"
    end
  end
end

describe RailsApp do
  def assert_tagfile(params = {})
    if Rails.version < '5'
      params[:simple] = nil
    end
    content = params.delete(:content)
    assert_body %(simple[#{params.inspect}](#{content}))
  end

  describe "w/o block" do
    it "renders partial from tagfiles/ w/o params aliased" do
      get "/test/simple_alias"
      assert_tagfile
    end

    it "renders partial from tagfiles/ w/o params" do
      get "/test/simple"
      assert_tagfile
    end

    it "renders partial from tagfiles/ with params" do
      get "/test/simple_with_params", param: "foo"
      assert_tagfile param: "foo"
    end
  end

  describe "with block" do
    it "renders layout from tagfiles/ w/o params" do
      get "/test/block"
      assert_tagfile content: "content"
    end

    it "renders layout from tagfiles/ with params" do
      get "/test/block_with_params", param: "foo"
      assert_tagfile param: "foo", content: "content"
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

    it "renders most outer simple tagfile" do
      get "/namespaced/test/simple"
      assert_tagfile
    end
  end

  describe "missing template" do
    it "error for missing template" do
      get "/test/missing"
      assert_equal 500, last_response.status
      assert_body ""
    end
  end

  describe "anonymous controllers" do
    let(:anon_controller) do
      Class.new(ActionController::Base) do
        def anon
          render inline: "<%= tf :simple %>"
        end
      end
    end

    it "renders tagfile even w/o a name" do
      controller = anon_controller
      RailsApp.routes.draw do
        get "/anon", to: controller.action(:anon)
      end

      get "/anon"
      assert_tagfile
    end
  end
end
