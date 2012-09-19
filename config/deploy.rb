require "bundler/capistrano"
require "capistrano/ext/multistage"
set :default_environment, { 'PATH' => "/home/rubycas-server/.rbenv/shims:/home/rubycas-server/.rbenv/bin:$PATH" }
set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"

set :application, 'rubycas-server'
set :stages, %w(development production)
set :scm, :git
set :deploy_via, :remote_cache
set :user, 'rubycas-server'
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

set :application, "rubycas-server"
set :repository,  "git@gitlab.synapse.com:rubycas-server.git"
require 'capistrano-unicorn'