# MANAGED BY PUPPET
# Module:: rubycas
#

worker_processes 2
user 'rubycas-server', 'rubycas-server'
working_directory "/home/rubycas-server/rubycas-server/current"

pid "/home/rubycas-server/rubycas-server/shared/pids/unicorn.pid"

listen 8001

stderr_path "/home/rubycas-server/rubycas-server/current/log/unicorn.stderr.log"
stdout_path "/home/rubycas-server/rubycas-server/current/log/unicorn.stdout.log"