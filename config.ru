#!/usr/bin/env rackup

require 'rack'

puts "Loading the application..."
require File.expand_path('../lib/project_nebula', __FILE__)
run ProjectNebula::Application
