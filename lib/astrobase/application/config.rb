
require 'sinatra/content_for'
require 'sinatra/flash'

#require 'astrobase/reloader'
require 'astrobase/jammit'
require 'astrobase/logging'
#require 'astrobase/sass'

require 'astrobase/helpers'

require 'astrobase/trailing_slash_remover'

class Astrobase::Application
  enable :sessions

  use Rack::Static, :urls => %w(/assets /javascripts /stylesheets /images), :root => 'public'
  helpers Sinatra::ContentFor
  register Sinatra::Flash

  #register Astrobase::Reloader
  register Astrobase::Jammit::Plugin
  register Astrobase::Logging::Plugin
  #register Astrobase::Sass

  helpers Astrobase::Helpers

  use Astrobase::TrailingSlashRemover
end
