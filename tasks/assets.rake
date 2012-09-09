
namespace :assets do
  desc "Cleans built assets"
  task :clean => :environment do
    FileUtils.rm_rf Astrobase.path('public/javascripts'), :verbose => true
    FileUtils.rm_rf Astrobase.path('public/stylesheets'), :verbose => true
    FileUtils.rm_rf Astrobase.path('public/assets'), :verbose => true
  end

  desc "Rebuilds public/javascripts and public/stylesheets from the files in app/ and vendor/"
  task :build => :environment do
    FileUtils.mkdir_p Astrobase.path('public/javascripts'), :verbose => true
    FileUtils.mkdir_p Astrobase.path('public/stylesheets'), :verbose => true
    FileUtils.ln_s '../../vendor/javascripts', Astrobase.path('public/javascripts/vendor'), :verbose => true
    FileUtils.ln_s '../../vendor/stylesheets', Astrobase.path('public/stylesheets/vendor'), :verbose => true
    Rake::Task['coffeescript:compile'].invoke
    Rake::Task['sass:compile'].invoke
  end
  task :rebuild => :build

  task :pack => [:build, 'jammit:package']
  task :repack => :pack
  task :package => :pack
end
