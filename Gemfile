
source :rubygems

ruby '1.9.3'

# Have to define this to create the binstub
gem 'rake'

gem 'pg', '0.14.1'
gem 'sequel', '3.39.0'
gem 'sinatra-sequel', '0.9.0'

group :development do
  gem 'thin', '~> 1.3.1'
end
group :production do
  gem 'puma', '1.4.0'
end

gem 'sinatra', '1.3.3'

gem 'sinatra-contrib', '1.3.1'

# https://github.com/SFEley/sinatra-flash
gem 'sinatra-flash', '0.3.0', :require => 'sinatra/flash'

gem 'jammit', :git => 'https://github.com/mcmire/jammit', :branch => 'fix_rails_assumptions'
# gem 'jammit', :path => "~/code/github/forks/jammit"
gem 'jammit-sinatra', '0.6.0.2'
gem 'tagz', '9.5.0'

gem 'logging', '1.7.2'

gem 'sinatra-simple-navigation', '3.5.1'

group :development do
  gem 'heroku', '~> 2.28.0'

  # guard
  gem 'guard', '~> 1.3.2'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'terminal-notifier-guard', '~> 1.5.3'
  # https://github.com/guard/listen/issues/62
  gem 'listen', '0.4.7'

  gem 'sass', '~> 3.2.1'
  gem 'guard-sass', '~> 1.0.0'

  gem 'coffee-script', '~> 2.2.0'
  gem 'guard-coffeescript', '~> 1.2.0'
end

