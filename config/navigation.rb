SimpleNavigation::Configuration.run do |config|
  config.autogenerate_item_ids = false

  config.items do |nav|
    nav.dom_id = 'ab-nav'

    nav.item :explore_by_type, 'Explore by Type', '/explore-by-type' do |types|
      types.item :planets, 'Planets', '/planets'
      types.item :dwarf_planets, 'Dwarf Planets', '/dwarf-planets'
      types.item :asteroids, 'Asteroids', '/asteroids'
      types.item :comets, 'Comets', '/comets'
      types.item :trojans, 'Trojans', '/trojans'
      types.item :centaurs, 'Centaurs', '/centaurs'
      types.item :stars, 'Stars', 'stars'
      types.item :nebulae, 'Nebulae', '/nebulae'
      types.item :galaxies, 'Galaxies', '/galaxies'
      types.item :quasars, 'Quasars', '/quasars'
    end

    nav.item :explore_by_region, 'Explore by Region', '/explore-by-region' do |regions|
      regions.item :solar_system, 'Solar System', '/solar-system'
      regions.item :extrasolar_space, 'Extrasolar Space', '/extrasolar_space'
      regions.item :extragalactic_space, 'Extragalactic Space', '/extragalactic_space'
    end

    nav.item :resources, 'Resources', '/resources' do |resources|
      resources.item :glossary, 'Glossary', '/glossary'
    end
  end
end

