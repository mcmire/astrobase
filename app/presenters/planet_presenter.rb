
require 'astrobase/presenter'

module Astrobase
  class PlanetPresenter < Presenter
    def linked_name
      %{<a href="#{url}">#{name}</a>}
    end
  end
end
