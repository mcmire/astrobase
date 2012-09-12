
class Astrobase::Presenter
  def self.wrap(app, models)
    models.map {|model| new(app, model) }
  end

  def self.model_class_name
    @model_class_name = self.to_s.sub(/Presenter$/, "")
  end

  def self.model_class
    @model_class ||= Astrobase.const_get(model_class_name)
  end

  attr_reader :app, :model

  def initialize(app, model)
    @app = app
    @model = model

    # Define a method on this instance patterned after the name of the model
    # that this presenter is wrapping.
    # For instance, a UserPresenter will have a "user" method that points to the
    # wrapped user object.
    model_name = self.class.model_class_name.gsub(/([a-z])([A-Z])/) { [$1, $2.downcase].join("_") }
    singleton_class.__send__(:define_method, model_name) { model }
  end

  def respond_to?(name)
    @model.respond_to?(name) || super
  end

  def method_missing(name, *args, &block)
    if @model.respond_to?(name)
      @model.__send__(name, *args, &block)
    else
      super
    end
  end
end
