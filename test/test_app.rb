require 'rubygems'
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'spongecms'

class TestApp < Sinatra::Base
  use Spongecms::Core

  get '/' do
    'test app'
  end

  run!
end


