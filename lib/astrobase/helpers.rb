
module Astrobase
  module Helpers
    def view(sym, opts={})
      if !opts.key?(:layout)
        opts[:layout] = settings.layout
      end
      erb sym, opts
    end

    def body_tags
      @body_tags ||= []
    end

    def window_title
      parts = ["Astrobase"]
      page_title = maybe(:page_title)
      parts << page_title if page_title
      parts.join(" - ")
    end

    def stylesheets
      include_stylesheets(:application)
    end

    def javascripts
      include_javascripts(:application)
    end

    def extra_head_content
      yield_content(:extra_head_content)
    end

    def extra_body_content
      yield_content(:extra_body_content)
    end

    def extra_javascript
      yield_content(:extra_javascript)
    end

    def app_env
      settings.environment
    end
  end
end

