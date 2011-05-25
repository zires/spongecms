# encoding: utf-8
require 'spongecms/core/base'
require 'spongecms/core/theme'

module Spongecms

  class Application < Spongecms::Base
    register Spongecms::Theme
  end

end
