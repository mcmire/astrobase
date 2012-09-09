#!/usr/bin/env rackup

require 'rack'

puts "Loading the application..."
require File.expand_path('../lib/astrobase', __FILE__)
run Astrobase::Application
