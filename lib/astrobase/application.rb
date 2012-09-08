
require 'sinatra/base'

module Astrobase
  class Application < Sinatra::Base; end
  require 'astrobase/application/config'
  require 'astrobase/application/routes'
end

