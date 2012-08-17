set :rails_env, "staging"
set :deploy_to, "/home/www/#{application}/#{stage}"
server 'core-intranet-dev-1.synapsedev.com', :app, :web, :db, :primary => true
set :branch, "master"