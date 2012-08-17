require 'sinatra/r18n'

module CASServer
  module Localization
    def self.included(mod)
      mod.module_eval do
        register Sinatra::R18n
        R18n.default_places { File.dirname(__FILE__) + '/../locales' }
        set :default_locale, 'en'
        #set :translations, File.dirname(__FILE__) + "/../locales"
      end
    end
  end
end
