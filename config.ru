#!/usr/bin/env rackup

unless defined?(Bundler)
  require 'bundler'
  Bundler.setup
end

require 'rack'

puts "Loading the application..."
require File.expand_path('../lib/astrobase', __FILE__)
run Astrobase::Application
