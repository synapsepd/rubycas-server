set :rails_env, "development"
set :deploy_to, "/home/vagrant/rubycas-server"
server '10.11.12.13', :app, :web, :db, :primary => true
set :branch, "master"
set :user, 'vagrant'