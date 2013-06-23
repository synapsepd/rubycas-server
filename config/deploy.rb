require "bundler/capistrano"
require "capistrano/ext/multistage"
require 'hipchat/capistrano'

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/puma"
load "config/recipes/git"
load "config/recipes/rubycas"

set :user, 'deployer'
set :application, "rubycas"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :bundle_flags, "--deployment --quiet --binstubs"
set :bundler, "/home/#{user}/.rbenv/shims/bundle"
set :default_environment, {
  'PATH' => "/home/#{user}/.rbenv/shims:/home/#{user}/.rbenv/bin:#{current_path}/bin:$PATH"
}

set :repository,  "git@gitlab.synapse.com:synapseit/rubycas-server.git"
set :stages, %w(staging production)
set :scm, :git
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

#hipchat
set :hipchat_token, "513b16064cff1be931093fb28f37c4"
set :hipchat_room_name, "The Hacker Dojo"
set :hipchat_announce, true # notify users?

#nginx
set :sudo_user, 'root'
set :app_port, "80"