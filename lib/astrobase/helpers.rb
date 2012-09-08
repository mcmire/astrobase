
module Astrobase
  module Helpers
    def body_tags
      @body_tags ||= []
    end

    def markdown(content, opts={})
      Kramdown::Document.new(content, opts).to_html
    end

    def full_url(*args)
      (["http://lostincode.net"] + args).join("/")
    end

    def remote_image_path(path)
      "http://s3.amazonaws.com/lostincode.net/blog/#{path}"
    end

    def line_wrap(text)
      #text.split(/, /).map {|s| s.gsub(" ", "&nbsp;") }.join(", ")
      text.split(/, /).join(",<br>")
    end
  end
end

