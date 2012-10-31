set :rails_env, "development"
set :deploy_to, "/home/rubycas/rubycas-server"
server 'core-intra-dev-1', :app, :web, :db, :primary => true
set :branch, "master"
set :user, 'rubycas'