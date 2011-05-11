# encoding: utf-8
require 'sinatra/base'
require 'padrino-helpers'
require 'spongecms/configuration'
require 'spongecms/themes'

module Spongecms

  class Base < Sinatra::Base
    # Use ::Base as Parent
    register Padrino::Helpers
    
    include Spongecms::Themes

    configure do
      set :path, Spongecms::Configuration.root
      # Set views and static files
      set :views, theme
      set :public, static_files
    end
    
    enable :sessions, :logging
    
    layout :layout
  end

end
