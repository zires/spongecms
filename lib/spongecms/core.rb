# encoding: utf-8
require 'spongecms/core/base'

module Spongecms

  class Core < Spongecms::Base
    # Use ::Core as middleware

    # spongecms index page
    get "/#{settings.path}" do
      @title = "Dashboard"
      haml :index
    end

  end

end
