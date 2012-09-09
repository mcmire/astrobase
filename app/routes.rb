
class Astrobase::Application
  get '/' do
    view 'index'
  end

  get '/explore-by-type' do
    view 'types'
  end

  get '/planets' do
    view 'planets/index'
  end

  get '/planets/:name' do
    @planet = Planet.first(:name => params[:name])
    view 'planets/show'
  end

  get '/dwarf-planets' do
    view 'dwarf_planets/index'
  end

  get '/asteroids' do
    view 'asteroids/index'
  end

  get '/comets' do
    view 'comets/index'
  end

  get '/trojans' do
    view 'trojans/index'
  end

  get '/centaurs' do
    view 'centaurs/index'
  end

  get '/stars' do
    view 'stars/index'
  end

  get '/nebulae' do
    view 'nebulae/index'
  end

  get '/galaxies' do
    view 'galaxies/index'
  end

  get '/quasars' do
    view 'quasars/index'
  end
end

