require "bundler/capistrano"
require "capistrano/ext/multistage"
require "rvm/capistrano"


set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")
before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset


set :stages, %w(development production)
set :scm, :git
set :deploy_via, :remote_cache
set :user, 'rubycas-server'
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

set :application, "rubycas-server"
set :repository,  "git@gitlab.synapse.com:rubycas-server.git"