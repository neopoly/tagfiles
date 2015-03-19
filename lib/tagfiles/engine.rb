module Tagfiles
  # Easy tagfile integration into Rails
  class Engine < Rails::Engine
    initializer "tagfiles" do
      ActiveSupport.on_load :action_controller do
        include Tagfiles::Tagfile
      end

      ActiveSupport.on_load :action_view do
        include Tagfiles::Tagfile
      end
    end
  end
end
