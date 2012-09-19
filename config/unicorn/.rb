# MANAGED BY PUPPET
# Module:: rubycas
#

worker_processes 2
user 'rubycas-server', 'rubycas-server'
working_directory APP_ROOT

pid "/home/vagrant/rubycas-server/  /pids/unicorn.pid"

listen 8001

stderr_path "/home/vagrant/rubycas-server/current/log/unicorn.stderr.log"
stdout_path "/home/vagrant/rubycas-server/current/log/unicorn.stdout.log"

# before_fork do |server, worker|
#   old_pid = "/home/vagrant/rubycas-server/shared/pids/unicorn.pid.oldbin"

#   if File.exists?(old_pid) && server.pid != old_pid
#     begin
#       Process.kill("QUIT", File.read(old_pid).to_i)
#     rescue Errno::ENOENT, Errno::ESRCH
#       # someone else did our job for us
#     end
#   end
# end