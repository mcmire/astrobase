
module Astrobase::Logging
  # Copied from Rack::CommonLogger
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      began_at = Time.now
      status, header, body = @app.call(env)
      header = Rack::Utils::HeaderHash.new(header)
      body = Rack::BodyProxy.new(body) { log(env, status, header, began_at) }
      [status, header, body]
    end

    def log(env, status, header, began_at)
      now = Time.now
      length = extract_content_length(header)

      Astrobase::Application.logger.info %("%s %s%s" %d %sb %0.4fs) % [
        env["REQUEST_METHOD"],
        env["PATH_INFO"],
        env["QUERY_STRING"].empty? ? "" : "?"+env["QUERY_STRING"],
        status.to_s[0..3],
        length,
        now - began_at
      ]
    rescue => e
      logger.error e
      raise e
    end

    def extract_content_length(headers)
      value = headers['Content-Length'] or return '-'
      value.to_s == '0' ? '-' : value
    end
  end
end

