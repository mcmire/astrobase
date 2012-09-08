
class Object
  # Whereas #try calls the given method and args only if this object is non-nil,
  # #maybe calls the given method and args on this object only if the method
  # exists, otherwise returning nil.
  #
  def maybe(name, *args)
    respond_to?(name) ? __send__(name, *args) : nil
  end
end

#---

require 'pp'
require 'singleton'

module Kernel
  class LoggerAppender
    include Singleton
    def <<(msg)
      Astrobase::Application.logger << "\e[33m"
      Astrobase::Application.logger << (msg || "")
      Astrobase::Application.logger << "\e[0m"
      msg
    end
  end

  # pretty print to app log
  def ppl(*objs)
    objs.each {|obj|
      PP.pp(obj, LoggerAppender.instance)
    }
    nil
  end
  module_function :ppl
end


