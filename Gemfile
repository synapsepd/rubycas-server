source "http://rubygems.org"

gem 'capistrano'
gem 'capistrano-ext'
gem 'capistrano_colors'

gem 'rubycas-server'
gem "mysql2"
gem 'activerecord-mysql2-adapter'
gem "activerecord"
gem "activesupport"
gem "sinatra"
gem 'sinatra-assetpack', :require => 'sinatra/assetpack'
gem 'less'
gem "therubyracer"
gem "sinatra-r18n"
gem "syslogger"
gem "crypt-isaac"
gem 'unicorn'
gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"
gem "newrelic_rpm"

group :development do
  gem 'capistrano-unicorn', :require => false
  gem 'foreman'
end

# Gems for authenticators
group :ldap do
    gem "net-ldap", "~> 0.1.1"
end

group :active_resource do
  gem "activeresource", ">= 2.3.12", "< 4.0"
end
