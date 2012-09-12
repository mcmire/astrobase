
require 'sinatra/sequel'

module Astrobase
  module Sequel
    def self.registered(app)
      app.register Sinatra::SequelExtension
    end
  end
end
