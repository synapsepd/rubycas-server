require "bundler/capistrano"
require "capistrano/ext/multistage"
require "rvm/capistrano"

set :stages, %w(development production)
set :scm, :git
set :deploy_via, :remote_cache
set :user, 'rubycas-server'
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

set :application, "rubycas-server"
set :repository,  "git@github.com:synapsepd/rubycas-server.git"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end