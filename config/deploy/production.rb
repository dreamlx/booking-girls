server "42.120.9.87", :app, :web, :db, :primary => true
set :rails_env, "production"

set(:deploy_to)         { "/home/dreamlinx/ROR/xiadan.me" }
set(:releases_path)     { File.join(deploy_to, version_dir) }
set(:shared_path)       { File.join(deploy_to, shared_dir) }
set(:current_path)      { File.join(deploy_to, current_dir) }
set(:release_path)      { File.join(releases_path, release_name) }

namespace :deploy do
  
  task :change_db , :roles => :app do
    run "mv #{release_path}/config/database.yml #{release_path}/config/database.yml.orig"
    run "mv #{release_path}/config/database.yml.production #{release_path}/config/database.yml"
  end

end