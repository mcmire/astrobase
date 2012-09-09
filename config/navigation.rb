SimpleNavigation::Configuration.run do |config|
  config.autogenerate_item_ids = false

  config.items do |nav|
    nav.dom_id = 'ab-nav'

    # TODO: I'm not sure if this is how it's going to work or not...
    # may have to do breadcrumbs manually since there are going to be SO many
    # pages...

    nav.item :explore_by_type, 'Explore by type', '/explore-by-type' do |types|
      types.item :sun_and_planets, 'Sun & planets', '/sun-and-planets' do |primary_bodies|
        primary_bodies.item :the_sun, '/stars/the-sun'
        primary_bodies.item :mercury, '/planets/mercury'
        primary_bodies.item :venus, '/planets/venus'
        primary_bodies.item :earth, '/planets/earth' do |earth|
          earth.item :satellites, '/planets/earth/satellites' do |satellites|
            satellites.item :the_moon, '/planets/earth/satellites/the-moon'
          end
        end
        primary_bodies.item :mars, '/planets/mars' do |mars|
          mars.item :satellites, '/planets/mars/satellites' do |satellites|
            satellites.item :phobos, '/planets/mars/satellites/phobos'
            satellites.item :deimos, '/planets/mars/satellites/deimos'
          end
        end
        primary_bodies.item :jupiter, '/planets/jupiter' do |jupiter|
          jupiter.item :satellites, '/planets/jupiter/satellites' do |satellites|
            # ... all 66 satellites ...
          end
        end
        primary_bodies.item :saturn, '/planets/saturn' do |saturn|
          saturn.item :satellites, '/planets/saturn/satellites' do |satellites|
            # ... all 53 named satellites ...
          end
        end
        primary_bodies.item :uranus, '/planets/uranus' do |uranus|
          # ...
        end
        primary_bodies.item :neptune, '/planets/neptune' do |neptune|
          # ...
        end
      end
      types.item :dwarf_planets, 'Dwarf planets', '/dwarf-planets'
      types.item :asteroids, 'Asteroids', '/asteroids'
      types.item :comets, 'Comets', '/comets'
      types.item :trojans, 'Trojans', '/trojans'
      types.item :centaurs, 'Centaurs', '/centaurs'
      types.item :stars, 'Stars', '/stars' do |stars|
        stars.item :brightest, 'Brightest', '/stars/brighest'
        stars.item :spectral_types, 'By spectral type', '/stars/by-spectral-type' do |types|
          types.item :blue, 'Blue (O)', '/stars/by-spectral-type/O'
          types.item :blue_white, 'Blue-white (B)', '/stars/by-spectral-type/B'
          types.item :white, 'White (A)', '/stars/by-spectral-type/A'
          types.item :yellow_white, 'Yellow-white (F)', '/stars/by-spectral-type/F'
          types.item :yellow, 'Yellow (G)', '/stars/by-spectral-type/G'
          types.item :orange, 'Orange (K)', '/stars/by-spectral-type/K'
          types.item :orange, 'Red (M)', '/stars/by-spectral-type/M'
        end
        stars.item :by_luminosity_class, 'By luminosity class', '/stars/by-luminosity-class' do |types|
          types.item :supergiants, 'Supergiants (I)', '/stars/by-lumosity-class/I'
          types.item :bright_giants, 'Bright giants (II)', '/stars/by-luminosity-class/II'
          types.item :giants, 'Giants (III)', '/stars/luminosity-classes/III'
          types.item :subgiants, 'Subgiants (IV)', '/stars/by-luminosity-class/IV'
          types.item :main_sequence, 'Main sequence (V)', '/stars/by-luminosity-class/V'
          types.item :subdwarfs, 'Subdwarfs (VI)', '/stars/by-luminosity-class/VI'
        end
        stars.item :by_population, 'By population', '/stars/by-population' do |types|
          types.item :population1, 'I', '/stars/by-population/I'
          types.item :population1, 'II', '/stars/by-population/II'
        end
        stars.item :novae, 'Novae', '/stars/novae'
        stars.item :supernovae, 'Supernovae', '/stars/novae'
        stars.item :binary_systems, 'Binary systems', '/stars/binary_systems'
        stars.item :brown_dwarfs, 'Brown dwarfs', '/stars/brown_dwarfs'
        stars.item :neutron_stars, 'Neutron stars', '/stars/neutron_stars'
        # .......
      end
      types.item :nebulae, 'Nebulae', '/nebulae'
      types.item :galaxies, 'Galaxies', '/galaxies'
      types.item :quasars, 'Quasars', '/quasars'
    end

    nav.item :explore_by_region, 'Explore by region', '/explore-by-region' do |regions|
      regions.item :solar_system, 'Solar system', '/solar-system'
      regions.item :extrasolar_space, 'Extrasolar space', '/extrasolar_space'
      regions.item :extragalactic_space, 'Extragalactic space', '/extragalactic_space'
    end

    nav.item :resources, 'Resources', '/resources' do |resources|
      resources.item :glossary, 'Glossary', '/glossary'
    end
  end
end

