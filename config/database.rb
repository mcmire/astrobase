
# Remember that this file is instance_eval'ed in the context of a
# Sequel::Database instance

run 'CREATE EXTENSION IF NOT EXISTS hstore'

puts "Creating the planets table..."
create_table! :planets do
  primary_key :id
  column :webkey, 'varchar(255)'
  column :name, 'varchar(255)'
  column :data, 'hstore'
end
run 'CREATE INDEX planets_data_gist_index ON planets USING GIST(data)'
