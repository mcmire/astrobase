
require 'sass'
require 'sass/plugin/rack'

module Astrobase::Sass
  def self.registered(app)
    app.class_eval do
      configure :development do
        use ::Sass::Plugin::Rack
      end
    end
  end
end
