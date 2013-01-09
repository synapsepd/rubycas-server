set :rails_env, "production"
set :deploy_to, "/home/rubycas/rubycas-server"
server 'core-intra-1', :app, :web, :db, :primary => true
set :branch, "master"
set :user, 'rubycas'