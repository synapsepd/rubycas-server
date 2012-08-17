set :rails_env, "production"
set :deploy_to, "/home/www/#{application}/#{stage}"
server 'core-intranet-1.synapsedev.com', :app, :web, :db, :primary => true
set :branch, "production"