# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :migrations do
  system("rake db:migrate && rake db:migrate RAILS_ENV=test")
end

task :drop do
  puts "dropping database..."
  system("rake db:drop && rake rm db/schema.rb")
end

task :reset do
  puts "drop database..."
  system("rake db:drop && rm db/schema.rb")
  puts "migrating databases"
  system("rake db:create db:migrate && rm db/schema.rb")
  puts "running rails server"
  system("rails s")
end