
if Astrobase.environment == 'production'
  level = :info
  destinations = %w(stdout)
else
  level = :debug
  destinations = %w(file stdout)
end
Astrobase::Logging.configure(level, destinations)
