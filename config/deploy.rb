require 'capistrano/ext/multistage'
set :stages, ["staging","production"]
set :default_stage, "production"
set :rvm_ruby_string, :local               # use the same ruby as used locally for deployment
set :rvm_autolibs_flag, "read-only"        # more info: rvm help autolibs

before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, OR:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset
require 'rvm/capistrano' 

#set :bundle_flags, '--quiet'

#set :rvm_type, :user
# main details
set :application, "xiadan.me"
set :keep_releases, 10 

#server details
default_run_options[:pty] = true  # Must be set for the password prompt
set :current_public, "#{current_path}/public"
set :user, "dreamlinx"
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
#repo details
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_username, "dreamlx"
set :scm_passphrase, "github2melx"
set :repository,  "git@github.com:dreamlx/xiadan_me.git"
set :branch, "master"
set :deploy_via, :remote_cache

after "deploy:update", "deploy:migrate"
after "deploy:migrate", "deploy:symlink_shared"
after "deploy:migrate", "deploy:precompile"
after 'deploy:update_code', 'deploy:change_db'

#tasks
namespace :deploy do
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :stop, :roles => :app do
    #do nonthing
  end
  
  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "rm -rf #{current_path}/public/uploads"
    run "ln -sf #{shared_path}/uploads #{current_path}/public/"
  end
  
  task :precompile, :roles => :web do  
    run "cd #{current_path} && #{rake} RAILS_ENV=production assets:precompile"  
  end  

end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

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
