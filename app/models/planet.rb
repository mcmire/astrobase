
require 'models/base'

module Astrobase
  class Planet < Model
    def url
      "/planets/#{webkey}"
    end
  end
end
