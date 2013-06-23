set :rails_env, "production"
server 'core-intra-1', :app, :web, :db, :primary => true
set :branch, current_git_branch