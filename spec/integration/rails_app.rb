require "rails"
require "action_controller/railtie"

class RailsApp < Rails::Application
  routes.append do
    get "/:action" => "test"
  end

  # Enable cache classes. Production style.
  config.cache_classes = true
  config.eager_load = true

  config.secret_key_base = "a" * 30
  # config.secret_token = "a" * 30

  self
end.initialize!

class TestController < ActionController::Base
  def hello_world
    render text: "Hello world!"
  end
end
