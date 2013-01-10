# MANAGED BY PUPPET
# Module:: rubycas
#

worker_processes 2
user 'rubycas', 'rubycas'
working_directory "/home/rubycas/rubycas-server/current"
preload_app true
pid "/home/rubycas/rubycas-server/shared/pids/unicorn.pid"

listen 8001

stderr_path "/home/rubycas/rubycas-server/current/log/unicorn.stderr.log"
stdout_path "/home/rubycas/rubycas-server/current/log/unicorn.stdout.log"