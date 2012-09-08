
source :rubygems

ruby '1.9.3'

gem 'sinatra', '1.3.2'

group :development do
  gem 'thin', '~> 1.3.1'
end
group :production do
  gem 'puma', '1.4.0'
end

gem 'sinatra-contrib'
# https://github.com/SFEley/sinatra-flash
gem 'sinatra-flash', '0.3.0', :require => 'sinatra/flash'
gem 'mustache', '0.99.4'
gem 'jammit', :git => 'https://github.com/mcmire/jammit', :branch => 'fix_rails_assumptions'
# gem 'jammit', :path => "~/code/github/forks/jammit"
gem 'jammit-sinatra', '0.6.0.2'
gem 'logging'

group :development do
  gem 'heroku', '~> 2.28.0'

  gem 'coffee-script', '~> 2.2.0'
  # execjs needs a Javascript runtime to function.
  # On Linux we can use therubyracer (v8); on Mac we don't have to do anything
  # since it already has JavascriptCore.
  # There isn't really a good way to do this otherwise.
  # See https://github.com/carlhuda/bundler/wiki/Platform-as-a-parameter
  gem 'therubyracer', '~> 0.9.8', :require => (RUBY_PLATFORM.include?('linux') && 'v8')

  # guard
  gem 'rb-fsevent'
  gem 'growl'
  gem 'colored'
end

group :development, :production do
  gem 'guard-sass'
  gem 'guard-coffeescript'
end

