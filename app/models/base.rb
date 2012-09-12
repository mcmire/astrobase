
module Astrobase
  class Model < ::Sequel::Model
    def self.inherited(subclass)
      super
      # Upon inheriting from our base model class, models do not assume a proper
      # table name, they are all set to :models. This is because by the time
      # this inherited hook is called, @dataset is already set, so that is just
      # re-used. We need to, therefore, reset it (pretending like this is
      # Sequel::Model not our Model class).
      subclass.set_dataset(subclass.implicit_table_name) rescue nil
    end
  end
end
