require "rails"
require "action_controller/railtie"

$LOAD_PATH << "../lib"
require "tagfiles"

#ENV["RAILS_ENV"] = "production"

class ExampleApp < Rails::Application
  routes.append do
    get "/" => "example#index"
  end

  config.eager_load = false

  config.secret_key_base = "a" * 30
  config.secret_token = "b" * 30
end

class ExampleController < ActionController::Base
  layout "application"

  def index
  end
end

ExampleApp.initialize!

run ExampleApp
