
require 'sinatra/simple-navigation'

# Redefine this for SimpleNavigation
Sinatra::Application.class_eval do
  def self.root; Astrobase.path; end
end

class Astrobase::Application
  register Sinatra::SimpleNavigation
end
