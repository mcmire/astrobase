
require 'sinatra/simple-navigation'

# Redefine this for SimpleNavigation
Sinatra::Application.class_eval do
  def self.root; Astrobase.path; end
end

module Astrobase
  module SimpleNavigation
    def self.registered(app)
      app.register Sinatra::SimpleNavigation
    end
  end
end
