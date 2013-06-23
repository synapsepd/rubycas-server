after 'deploy:stop', 'puma:stop'
after 'deploy:start', 'puma:start'
after 'deploy:restart', 'puma:restart'

_cset(:puma_cmd) { "#{fetch(:bundle_cmd, 'bundle')} exec puma" }
_cset(:pumactl_cmd) { "#{fetch(:bundle_cmd, 'bundle')} exec pumactl" }
_cset(:puma_state) { "#{shared_path}/sockets/#{application}-puma.state" }
_cset(:puma_ctl_sock) { "#{shared_path}/sockets/#{application}-pumactl.sock" }
_cset(:puma_sock) { "#{shared_path}/sockets/#{application}-puma.sock" }
_cset(:puma_pid) { "#{shared_path}/pids/puma.pid" }
_cset(:puma_role) { :app }

namespace :puma do
  desc 'Start puma'
  task :start, :roles => lambda { fetch(:puma_role) }, :on_no_matching_servers => :continue do
    puma_env = fetch(:rack_env, fetch(:rails_env, 'production'))
    run "cd #{current_path} && #{fetch(:puma_cmd)} --config #{shared_path}/config/puma.rb", :pty => false
  end

  desc 'Stop puma'
  task :stop, :roles => lambda { fetch(:puma_role) }, :on_no_matching_servers => :continue do
    run "cd #{current_path} && #{fetch(:pumactl_cmd)} -S #{fetch(:puma_state)} stop"
  end

  desc 'Restart puma'
  task :restart, :roles => lambda { fetch(:puma_role) }, :on_no_matching_servers => :continue do
    run "cd #{current_path} && #{fetch(:pumactl_cmd)} -S #{fetch(:puma_state)} restart"
  end

  desc "Install puma configuration"
  task :setup, roles: :app do
    template "puma.erb", "/tmp/puma_conf"
    run "cd #{shared_path} && mkdir config"
    run "cd #{shared_path} && mkdir sockets"
    run "#{sudo} mv /tmp/puma_conf #{shared_path}/config/puma.rb"
  end
  after "deploy:setup", "puma:setup"
end