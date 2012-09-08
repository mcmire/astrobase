
require 'pp'

module Astrobase
  PATH = ::File.expand_path('../..', __FILE__)
  LIBPATH = ::File.join(PATH, 'lib')

  # Get the root path of the project. If any arguments are given, they are
  # concatenated to the path using `File.join`.
  #
  def self.path(*args)
    rv = ::File.join(PATH, args.flatten)
    if block_given?
      begin
        $LOAD_PATH.unshift(PATH)
        rv = yield
      ensure
        $LOAD_PATH.shift
      end
    end
    return rv
  end

  # Get the library path of the project. If any arguments are given, they are
  # concatenated to the path using `File.join`.
  #
  def self.libpath(*args)
    rv = ::File.join(LIBPATH, args.flatten)
    if block_given?
      begin
        $LOAD_PATH.unshift(LIBPATH)
        rv = yield
      ensure
        $LOAD_PATH.shift
      end
    end
    return rv
  end

  def self.environment
    @environment ||= (ENV['RACK_ENV'] || 'development')
  end

  module Models; end
  module Presenters; end

  $:.unshift path('app')
  $:.unshift libpath

  require 'astrobase/core_ext'
  # this must be loaded first because we need to patch Rack before we require
  # Sinatra
  require 'astrobase/logging'
  require 'astrobase/application'
end
