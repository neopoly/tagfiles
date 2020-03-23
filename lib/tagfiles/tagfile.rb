# Tagfiles provides the `tagfile` helper for Rails.
module Tagfiles
  # Tagfile implementation
  module Tagfile
    # Renders a +layout+ when called with a block or +partial+ otherwise.
    #
    # @param name [String] name of the used tagfile
    # @param locals [Hash] optional locals passed to the tagfile
    #
    # @example
    #   app/views/admin/page/index.html.erb:
    #
    #     <%= tagfile :box, title: 23 do %>
    #       Box content
    #     <% end %>
    #
    #   app/views/tagfiles/_box.html.erb
    #
    #     <div class="box">
    #       <h2><%= title %></h2>
    #       <p><%= yield %></p>
    #     </div>
    #
    # Following partial lookups will be performed:
    # * app/views/admin/page/tagfiles/_box.html.erb
    # * app/views/admin/tagfiles/_box.html.erb
    # * app/views/tagfiles/_box.html.erb
    def tagfile(name, locals = {}, &block)
      prefix = lookup_tagfile_prefix(controller.controller_path || "", name)

      if block
        render layout: "#{prefix}/#{name}", locals: locals, &block
      else
        render partial: "#{prefix}/#{name}", locals: locals
      end
    end

    alias_method :tf, :tagfile

    private

    TAGFILES_DIR = "tagfiles".freeze

    def lookup_tagfile_prefix(controller_path, name)
      parts = controller_path.split("/")

      loop do
        prefix = (parts + [TAGFILES_DIR]).join("/")
        break prefix if controller.template_exists?(name, [prefix], true)

        parts.pop
        break TAGFILES_DIR if parts.empty?
      end
    end
  end
end
