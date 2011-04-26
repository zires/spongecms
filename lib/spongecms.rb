# encoding: utf-8
require 'active_support'
require 'sinatra'

require 'spongecms/configuration'

module Spongecms

  # setup spongecms with giving params
  # ===
  #   Spongecms.setup do |config|
  #     config.theme = "default"
  #   end
  def self.setup
    yield(Spongecms::Configuration)  
  end

end

require 'spongecms/sinatra'
require 'spongecms/version'
