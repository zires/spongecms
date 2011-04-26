$:.unshift File.expand_path(File.dirname(__FILE__) + "/../lib")
require 'rspec'
require 'spongecms'
require 'rack/test'

ENV['RACK_ENV'] = 'test'
