
require 'guard/coffeescript'
require 'guard/coffeescript/runner'

# Sass
guard 'sass', :input => 'app/stylesheets', :output => 'public/stylesheets/app'

# CoffeeScript
guard 'coffeescript', :input => 'app/javascripts', :output => 'public/javascripts/app', :bare => true do
  callback(:start_begin) do
    CoffeeScript::Runner.class_eval do
      class << self
        alias :old_compile :compile unless method_defined?(:old_compile)
        def compile(file, options)
          compiled = old_compile(file, options)
          # Wrap everything in a custom wrapper
          "(function(window, document, $, undefined) {\n\n#{compiled}\n\n})(this, this.document, this.ender);"
        end
      end
    end
  end
end

