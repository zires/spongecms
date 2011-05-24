# encoding: utf-8
require 'spongecms/configuration'
require 'active_support/concern'

module Spongecms
  module Theme
    class << self
      # register theme helper
      def registered(app)
        # Set views and static files
        app.set :views, theme
        app.set :public, static_files
        app.layout :layout
      end

      def theme
        find_theme(Spongecms::Configuration.theme)
      end

      def static_files
        File.join(theme, 'public')    
      end

      protected

      def theme_dirs
        [Spongecms::Configuration.theme_dir, Spongecms::Configuration.default_theme_dir].flatten.uniq 
      end

      def find_theme(theme)
        theme_dirs.each do |dir|
          Dir.entries(dir).each do |name|
            path = File.join(dir, name)
            return path if File.directory?(path) and name == theme
          end
        end
        raise Spongecms::Exception, "Can't find theme #{theme} in the #{theme_dirs.join(',')}."
      end
    end
  end
end
