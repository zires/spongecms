# encoding: utf-8
require 'active_support/concern'
require 'spongecms/exception'

module Spongecms
  module Themes
    extend ActiveSupport::Concern
    # Set views dir
    module ClassMethods
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
