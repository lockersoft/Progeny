require 'capistrano-deploy'
require 'rvm/capistrano'

set :application, "progeny"
set :repository, "https://github.com/lockersoft/Progeny.git"
set :user, "dljones"
set :port, 65042
set :use_sudo, false
set :deploy_to, "/home/#{user}/public_html/#{application}"
server "lockersoft.cloudapp.net", :app, :web, :db, :primary => true

set :deploy_via, :remote
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end