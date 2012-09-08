
require 'sinatra/reloader'

module Astrobase
  module Reloader
    def self.registered(app)
      app.class_eval do
        configure :development do
          register Sinatra::Reloader
          also_reload Astrobase.path('app/views/**/*.rb')
          also_reload Astrobase.libpath('astrobase/models/**/*.rb')
          also_reload Astrobase.libpath('astrobase/presenters/**/*.rb')
        end
      end
    end
  end
end
