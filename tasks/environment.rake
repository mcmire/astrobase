
task :environment do
  $:.unshift File.expand_path('../../lib', __FILE__)
  require 'astrobase'
end
