# encoding: utf-8
require 'sinatra/base'
require 'spongecms/configuration'
require 'spongecms/themes'

module Spongecms

  class Sinatra < Sinatra::Base
    # Use sinatra as middleware
    include Spongecms::Themes
    configure do
      set :root, Spongecms::Configuration.root

      # Set views and static files
      set :views, theme
      set :public, static_files
    end

    get "/#{settings.root}" do
      haml :index 
    end

  end

end
