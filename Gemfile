source "http://rubygems.org"

gem 'appraisal'
gem 'synapse-rubycas-server', "1.1.4"
gem "mysql2"
gem 'activerecord-mysql2-adapter'
gem "activerecord"
gem "activesupport"
gem "sinatra"
gem "sinatra-r18n"
gem 'puma', "~> 2.1.1"
gem "newrelic_rpm"

group :development do
  gem 'capistrano-ext'
  gem 'capistrano_colors'
  gem 'capistrano-rbenv'
  gem 'capistrano-unicorn', :require => false
  gem 'foreman'
  gem 'hipchat'
end

# Gems for authenticators
group :ldap do
  gem "net-ldap", "~> 0.1.1"
end

group :active_resource do
  gem "activeresource", ">= 2.3.12", "< 4.0"
end
