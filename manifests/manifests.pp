filebucket { main: server => 'puppetmaster.synapsedev.com' }

class {
  'rubycas':
    app_url           => '10.11.12.13',
    app_user          => 'rubycas-server',
    app_home          => '/home/rubycas-server',
    rails_environment => 'development'
}