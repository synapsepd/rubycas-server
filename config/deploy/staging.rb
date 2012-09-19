set :rails_env, "development"
set :deploy_to, "/home/rubycas/rubycas-server"
server '10.0.31.81', :app, :web, :db, :primary => true
set :branch, "master"
set :user, 'rubycas'