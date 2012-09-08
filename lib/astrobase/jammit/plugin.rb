
require 'jammit'
require 'jammit/sinatra'
require 'astrobase/jammit/helpers'

module Astrobase::Jammit
  module Plugin
    def self.registered(app)
      # Tell Jammit about the current environment
      Object.const_set(:JAMMIT_ENV, app.environment.to_s)
      ::Jammit.load_configuration Astrobase.path('config/assets.yml')
      app.class_eval do
        configure :development do
          use ::Jammit::Middleware
        end
        helpers ::Jammit::Helper
        helpers ::Jammit::HelperOverrides
        helpers Helpers
      end
    end
  end
end
