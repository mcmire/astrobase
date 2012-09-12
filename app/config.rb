
# simple-navigation

require 'astrobase/simple_navigation'

class Astrobase::Application
  register Astrobase::SimpleNavigation
end

# sequel, with pg hstore

require 'astrobase/sequel'

class Astrobase::Application
  register Astrobase::Sequel
  set :database_url, lambda {
    if environment == :production
      # ...
    else
      'postgres://localhost/astrobase?user=root&password='
    end
  }
  database.extension(:pg_hstore)
end

