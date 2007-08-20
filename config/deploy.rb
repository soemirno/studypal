# This defines a deployment "recipe" that you can feed to capistrano
# (http://manuals.rubyonrails.com/read/book/17). It allows you to automate
# (among other things) the deployment of your application.

# =============================================================================
# REQUIRED VARIABLES
# =============================================================================
# You must always specify the application and repository for every recipe. The
# repository must be the URL of the repository you want this recipe to
# correspond to. The deploy_to path must be the path on each machine that will
# form the root of the application path.
set :application, "studypal"
set :repository,  "https://studypal.googlecode.com/svn/trunk/"

# =============================================================================
# ROLES
# =============================================================================
# You can define any number of roles, each of which contains any number of
# machines. Roles might include such things as :web, or :app, or :db, defining
# what the purpose of each machine is. You can also specify options that can
# be used to single out a specific subset of boxes in a particular role, like
# :primary => true.
server =  "82.146.52.204"
role :app, server
role :web, server
role :db,  server, :primary => true

# =============================================================================
# OPTIONAL VARIABLES
# =============================================================================
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"
set :deploy_to, "/var/www/#{application}" # defaults to "/u/apps/#{application}"
set :runner, "soemirno"

desc "After updating code we need to populate a new database.yml"
task :after_update_code, :roles => :app do
  require "yaml"
  set :production_database_password, proc { Capistrano::CLI.password_prompt("Production database remote Password : ") }

  buffer = YAML::load_file('config/database.yml.template')
  # get ride of uneeded configurations
  buffer.delete('test')
  buffer.delete('development')

  # Populate production element
  buffer['production']['adapter'] = "mysql"
  buffer['production']['database'] = "studypal_production"
  buffer['production']['username'] = "root"
  buffer['production']['password'] = "gxoonfoc" #production_database_password
  buffer['production']['host'] = "localhost"

  put YAML::dump(buffer), "#{release_path}/config/database.yml", :mode => 0664
end

desc "The spinner task is used by :cold_deploy to start the application up"
task :spinner, :roles => :app do
  run "cd #{deploy_to}/#{current_dir} && mongrel_rails start"
end

desc "Restart the mongrel cluster"
task :restart, :roles => :app do
  run "cd #{deploy_to}/#{current_dir} && mongrel_rails restart"
end