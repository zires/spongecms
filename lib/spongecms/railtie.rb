require 'spongecms/sinatra'

module Spongecms
  class Railtie < Rails::Railtie
    config.middleware.use Spongecms::Sinatra
  end
end
