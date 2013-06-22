require 'bundler/capistrano'
require 'capistrano-deploy'
require 'rvm/capistrano'

set :application, "progeny"
set :repository, "https://github.com/lockersoft/Progeny.git"
set :user, "dljones"
set :port, 65042
set :use_sudo, false
set :deploy_to, "/home/#{user}/public_html/#{application}"
set :deploy_via, :remote_cache

default_run_options[:pty] = true    # Fixes problem of: "no tty present and no askpass program specified"
use_recipe :bundle
after 'deploy:update', 'bundle:install'

use_recipe :rails_assets
after 'deploy:update', 'deploy:assets:precompile'

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
#  Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "lockersoft.cloudapp.net", :app, :web, :db, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart" #, "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
namespace :deploy do
  task :start do
    ;
  end
  task :stop do
    ;
  end
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end


task :showfiles do
  run "ls -al"
end