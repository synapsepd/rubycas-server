set :rails_env, "production"
server 'sso1.synapse.com', :app, :web, :db, :primary => true
set :branch, current_git_branch
set :server_name, 'sso1.synapse.com'