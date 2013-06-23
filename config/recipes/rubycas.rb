namespace :rubycas do
  desc "Setup nginx configuration for this application"
  task :setup, roles: :web do
    template "rubycas.erb", "/tmp/rubycas"
    run "#{sudo} mv /tmp/rubycas /etc/rubycas-server/config.yml"
  end
  after "deploy:setup", "rubycas:setup"
end

# NOTE: I found it necessary to manually fix the init script as shown here
# https://bugs.launchpad.net/nginx/+bug/1033856