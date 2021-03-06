# encoding: utf-8
require 'spongecms/configuration'
require 'spongecms/core/hook'

module Spongecms
  module Theme
    
    module Helpers
      # position holds hook for partial insert or update
      def position(name, *args, &block)
        theme_hook.position(name, capture_html(*args, &block))
        theme_hook.output(name)
      end

      # insert after position
      def insert_after(name, content = nil, &block)
        content = content.nil? ? capture_html(&block) : content
        theme_hook.position(name, content, :insert_after)
      end

      # insert before position
      def insert_before(name, content = nil, &block)
        content = content.nil? ? capture_html(&block) : content
        theme_hook.position(name, content, :insert_before)
      end

      # update position
      def update(name, content = nil, &block)
        content = content.nil? ? capture_html(&block) : content
        theme_hook.position(name, content, :update)
      end

      # render as default template handler
      def tilt(template, opts={})
        handler = opts.key?(:default) ? opts.delete(:default).downcase : Spongecms::Configuration.tilt
        send handler.to_sym, template, opts
      end
      
      protected
      
      # Hook instance
      def theme_hook
        Spongecms::Theme::Hook.instance
      end
    end

    class << self
      # register theme helper
      def registered(app)
        # Set views and static files
        app.set :views, theme
        app.set :public, static_files
        app.layout :layout
        app.helpers Spongecms::Theme::Helpers
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
