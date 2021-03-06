require "rails"
require "action_controller/railtie"

# TODO: Find out how to remove this line below
require "tagfiles/engine"

class RailsApp < Rails::Application
  routes.append do
    get "/:controller/:action"
    namespace :namespaced do
      get "/:action" => "test"
    end
  end

  config.logger = nil
  config.log_level = :warn

  # Enable cache classes. Production style.
  config.cache_classes = true
  config.eager_load = true

  config.secret_key_base = "a" * 30
  config.secret_token = "b" * 30

  config.root = File.expand_path("./rails_app", File.dirname(__FILE__))
end

RailsApp.initialize!
