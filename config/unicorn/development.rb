# MANAGED BY PUPPET
# Module:: rubycas
#

worker_processes 2
user 'vagrant', 'vagrant'
working_directory "/home/vagrant/rubycas-server/current"

pid "/home/vagrant/rubycas-server/shared/pids/unicorn.pid"

listen 8001

stderr_path "/home/vagrant/rubycas-server/current/log/unicorn.stderr.log"
stdout_path "/home/vagrant/rubycas-server/current/log/unicorn.stdout.log"