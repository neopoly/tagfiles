module Tagfiles
  module Tagfile
    # Renders a +layout+ when called with a block or +partial+ otherwise.
    #
    # @example
    #   app/views/admin/page/index.html.erb:
    #     <%= tagfile :box, var1: 23 %>
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

    TAGFILES_DIR = "tagfiles"

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
