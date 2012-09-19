filebucket { main: server => 'puppetmaster.synapsedev.com' }

class {
  'rubycas':
    app_url           => '10.11.12.13',
    app_user          => 'vagrant',
    app_home          => '/home/vagrant',
    ruby_environment  => 'development',
    database_user     => 'casserver_user',
    database_password => 'DaDLw7a7oXZVWz',
    database_host     => 'core-internal.cg3ywao0k1nv.us-west-2.rds.amazonaws.com',
    ldap_base         => 'OU=Synapsters,OU=SBSUsers,OU=Users,OU=MyBusiness,DC=synapsedev,DC=com',
    ldap_filter       => '(&(objectCategory=person)(objectClass=user))',
    ldap_auth_user    => 'SYNAPSEDEV\~svcProvisioningConf',
    ldap_auth_password => 'IZE6CgJhIZZYbKfyW4Po';
}