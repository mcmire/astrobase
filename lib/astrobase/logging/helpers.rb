
require 'logging'

module Astrobase::Logging
  module Helpers
    def logger
      ::Logging.logger['Astrobase::Application']
    end
  end
end
