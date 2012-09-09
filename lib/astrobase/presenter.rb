
class Astrobase::Presenter
  attr_reader :view
  attr_reader :object

  def initialize(view, object)
    @view = view
    @object = object
  end

  def app
    @view.app
  end

  def respond_to?(name)
    @object.respond_to?(name) || super
  end

  def method_missing(name, *args, &block)
    if @object.respond_to?(name)
      @object.__send__(name, *args, &block)
    else
      super
    end
  end
end
