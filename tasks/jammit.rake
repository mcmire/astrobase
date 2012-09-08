
namespace :jammit do
  desc "Package all assets"
  task :package do
    puts "Packaging assets..."
    Jammit.package!
  end
end
