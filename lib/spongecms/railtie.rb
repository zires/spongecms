require 'spongecms/sinatra'

module Spongecms
  class Railtie < Rails::Railtie
    initializer "spongecms_railtie.configure_rails_initialization" do |app|
      app.middleware.use Spongecms::Sinatra
    end
  end
end
