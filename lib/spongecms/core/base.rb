# encoding: utf-8
require 'sinatra/base'
require 'padrino-helpers'
require 'spongecms/core/route'
require 'spongecms/core/theme'

module Spongecms

  class Base < Sinatra::Base
    # Use ::Base as Parent
    register Padrino::Helpers
    register Spongecms::Route 
    register Spongecms::Theme

    include Spongecms::Route
    
    enable :sessions, :logging
  end
end
