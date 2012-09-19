set :rails_env, "production"
set :deploy_to, "/home/rubycas-server/#{application}"
server 'core-sso-1.synapsedev.com', :app, :web, :db, :primary => true
set :branch, "master"
set :user, 'rubycas-server'