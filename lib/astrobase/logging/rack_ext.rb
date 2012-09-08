
# Disable Rack's logging middleware because we provide our own
module Rack
  class CommonLogger
    def call(env)
      # do nothing
      @app.call(env)
    end
  end
end
