# encoding: utf-8
require 'active_support/core_ext/module/attribute_accessors'

module Spongecms
  
  module Configuration

    # Default setup
    # =>default theme dir
    mattr_accessor :default_theme_dir
    @@default_theme_dir = File.expand_path(File.dirname(__FILE__) + "/../../themes")

    # =>theme addition dir
    mattr_accessor :theme_dir
    @@theme_dir = []

    # =>theme
    # whitch theme to use
    mattr_accessor :theme
    @@theme = "default"

    # =>alias routes
    mattr_accessor :root
    @@root = "spongecms"
    
    # registered plugins
    mattr_accessor :plugins
    @@plugins = []
  end

end
