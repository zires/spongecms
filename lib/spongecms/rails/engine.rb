# encoding: utf-8
require 'rails'
require 'spongecms/sinatra'

module Spongecms
  module Rails
    class Engine < Rails::Engine
      config.middleware.use Spongecms::Sinatra 
    end
  end
end
