
namespace :db do
  task :create => :environment do
    `createdb -U root astrobase`
  end

  task :build => :environment do
    puts "== Building the database..."
    db = Astrobase::Application.database
    fn = Astrobase.path('config/database.rb')
    content = File.read(fn)
    db.instance_eval(content, fn, 1)
  end

  task :seed_planets do
    require 'models/planet'
    Astrobase::Planet.create(
      :webkey => 'mars',
      :name => 'Mars',
      :data => {
        :foo => 'bar',
        :baz => 'quux'
      }
    )
    puts "Created a planet."
  end

  task :seed => :environment do
    puts "== Seeding the database"
    Rake::Task['db:seed_planets'].invoke
  end

  task :reset => [:build, :seed]
end
