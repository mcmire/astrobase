
require 'logging'
include Logging.globally

module Astrobase
  # A lot of this was copied from Logging::Rails
  module Logging
    DEFAULT_PATTERN = '[%d] %-5l (%c) %m\n'

    def self.configure(level, destinations)
      @level = level
      @destinations = destinations
      _configure_object_logging
      _configure_color_scheme
      _configure_root_logger
    end

    def self.set_logger_appenders(logger, opts={})
      appenders = []
      if @destinations.include?('stdout')
        appenders << _build_stdout_appender(opts)
      end
      if @destinations.include?('file')
        appenders << _build_file_appender(opts)
      end
      logger.appenders = appenders
    end

    # Build an appender that will write log events to STDOUT. A colorized
    # pattern layout is used to format the log events into strings before
    # writing.
    #
    def self._build_stdout_appender(opts={})
      pattern = opts[:pattern] || DEFAULT_PATTERN
      # set a name for the appender even though we're not going to use it
      ::Logging.appenders.stdout('stdout',
        :auto_flushing => true,
        :layout => ::Logging.layouts.pattern(
          :pattern => pattern,
          :color_scheme => 'bright'
        )
      )
    end

    # Build an appender that will write log events to a file. The file will be
    # rolled on a daily basis, and the past 7 rolled files will be kept. Older
    # files will be deleted. The default pattern layout is used when formatting
    # log events into strings.
    #
    def self._build_file_appender(opts={})
      pattern = opts[:pattern] || DEFAULT_PATTERN
      # set a name for the appender even though we're not going to use it
      ::Logging.appenders.rolling_file('file',
        :filename => Astrobase.path("log/#{Astrobase.environment}.log"),
        :keep => 7,
        :age => 'daily',
        :truncate => false,
        :auto_flushing => true,
        :layout => ::Logging.layouts.pattern(:pattern => pattern)
      )
    end

    # Configure the Logging gem so that objects will be converted to strings
    # using the :format_as method.
    #
    def self._configure_object_logging
      ::Logging.format_as :inspect
    end

    # Set up a color scheme called 'bright' than can be used to add color codes
    # to the pattern layout. Color schemes should only be used with appenders
    # that write to STDOUT or STDERR; inserting terminal color codes into a file
    # is generally considered bad form.
    #
    def self._configure_color_scheme
      ::Logging.color_scheme('bright',
        :levels => {
          :debug => :green,
          :info  => :green,
          :warn  => :yellow,
          :error => :red,
          :fatal => [:white, :on_red]
        },
        :date => [:blue, :bold],
        :logger => :cyan,
        :message => :white
      )
    end

    def self._configure_root_logger
      root_logger = ::Logging.logger.root
      root_logger.level = @level
      set_logger_appenders(root_logger)
    end
  end

  require 'astrobase/logging/rack_ext'
  require 'astrobase/logging/config'
  require 'astrobase/logging/plugin'
end

