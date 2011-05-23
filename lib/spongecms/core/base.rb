# encoding: utf-8
require 'sinatra/base'
require 'padrino-helpers'
require 'spongecms/core/route'
require 'spongecms/themes'

module Spongecms

  class Base < Sinatra::Base
    # Use ::Base as Parent
    register Padrino::Helpers
    register Spongecms::Route 

    include Spongecms::Themes
    include Spongecms::Route
    # Set views and static files
    set :views, theme
    set :public, static_files

    enable :sessions, :logging

    layout :layout

  end
end
