
require 'astrobase/logging/helpers'
require 'astrobase/logging/middleware'

module Astrobase::Logging
  module Plugin
    def self.registered(app)
      app.disable :logging
      app.helpers Helpers
      app.use Middleware
    end

    def logger
      # do not log the class of the instance that logged the message, we know
      # that the application logged the message
      @logger ||= ::Logging.logger['Astrobase::Application'].tap do |logger|
        logger.additive = false
        Astrobase::Logging.set_logger_appenders(logger, :pattern => '[%d] %-5l %m\n')
      end
    end
  end
end
