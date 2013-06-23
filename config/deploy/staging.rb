set :rails_env, "production"
server 'sso-dev.synapse.com', :app, :web, :db, :primary => true
set :branch, current_git_branch
set :server_name, 'sso-dev.synapse.com'