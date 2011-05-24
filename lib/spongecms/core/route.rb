# encoding: utf-8
require 'spongecms/configuration'
require 'active_support/concern'

module Spongecms
  module Route
    extend ActiveSupport::Concern

    module Helpers
      # root absolute path
      def root_path
        "/#{Spongecms::Configuration.root}"
      end
    end

    module ClassMethods

      # root method just like get, post ...
      #   root do
      #     haml :index
      #   end
      # => equal as
      #   get '/#{Spongecms::Configuration.root}' do
      #     haml :index
      #   end
      # 
      #   root '/example', :via =>:post do
      #     haml :index
      #   end
      # => equal as
      #   post "/#{Spongecms::Configuration.root}/example" do
      #     haml :index
      #   end
      # 
      # via options
      # =>:get, :post, :put, :head, :delete.Default is :get
      def root(path = nil, opts = {}, &block)
        handler = opts.key?(:via) ? opts.delete(:via).downcase : :get
        default_path = opts.key?(:default_path) ? opts.delete(:default_path): Spongecms::Configuration.root
        path = path.nil? ? "/#{default_path}" : "/#{default_path}/#{path}" 
        send handler, path, opts, &block
      end

    end

    # register route helper
    def self.registered(app)
      app.set :path, Spongecms::Configuration.root
      app.helpers Spongecms::Route::Helpers
    end
  end
end

