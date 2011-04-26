# encoding: utf-8
require 'sinatra/base'
require 'spongecms/themes'

module Spongecms

  class Sinatra < Sinatra::Base
    # Use sinatra as middleware
    ROOT = Spongecms::Configuration.root
    include Spongecms::Themes

    # Set views and static files
    set :views, theme
    set :public, static_files

    get "/#{ROOT}" do
      haml :index 
    end

  end

end
