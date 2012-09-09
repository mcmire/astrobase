
require 'sinatra/base'

require 'sinatra/content_for'
require 'sinatra/flash'

#require 'astrobase/reloader'
require 'astrobase/jammit'
require 'astrobase/logging'
#require 'astrobase/sass'

require 'astrobase/helpers'

require 'astrobase/trailing_slash_remover'

module Astrobase
  class Application < Sinatra::Base
    set :views, Astrobase.path('app/views')

    helpers Sinatra::ContentFor

    enable :sessions
    register Sinatra::Flash

    #register Astrobase::Reloader
    register Astrobase::Jammit::Plugin
    register Astrobase::Logging::Plugin
    #register Astrobase::Sass

    helpers Astrobase::Helpers

    use Astrobase::TrailingSlashRemover

    use Rack::Static,
      :urls => %w(/assets /javascripts /stylesheets /images),
      :root => 'public'

    error 404 do
      _render_404
    end

    configure :production do
      error 500 do
        _render_500
      end
    end

    def _render_404
      erb :'errors/not_found', :layout => :'layouts/application'
    end

    def _render_500
      erb :'errors/server_error', :layout => :'layouts/application'
    end
  end

  require path('app/config')
  require path('app/routes')
end

