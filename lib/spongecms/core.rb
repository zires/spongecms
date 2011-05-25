# encoding: utf-8
require 'spongecms/core/application'

module Spongecms

  class Core < Spongecms::Application
    # Use ::Core as middleware

    # spongecms index page
    root do
      @title = "Dashboard"
      haml :index
    end

  end

end
