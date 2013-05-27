server "42.120.9.87", :app, :web, :db, :primary => true
set :rails_env, "staging"

set(:deploy_to)         { "/home/dreamlinx/ROR/test.booking-girls.com" }
set(:releases_path)     { File.join(deploy_to, version_dir) }
set(:shared_path)       { File.join(deploy_to, shared_dir) }
set(:current_path)      { File.join(deploy_to, current_dir) }
set(:release_path)      { File.join(releases_path, release_name) }