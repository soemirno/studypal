default_run_options[:pty] = true
set :repository,  "git://github.com/soemirno/studypal.git"
set :scm, "git"
set :user, "deployer"
set :runner, "deployer"
set :branch, "master"
set :application, "study-pal"

role :app, "app"
role :web, "web"
role :db,  "db", :primary => true

#############################################################
#	Passenger
#############################################################
namespace :deploy do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :start do
  end
end

# DATABASE only  
after 'deploy:update_code', 'db:symlink'
namespace :db do
  task:symlink do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

# Adding the custom config folder into Capistrano’s shared directory, after it sets up the server.
desc "Tasks for after setup"
task :after_setup, :roles => [:app, :db, :web] do
  run "mkdir #{shared_path}/config"
end
