# encoding: utf-8
require 'singleton'

module Spongecms
  module Theme

    class Hook
      include Singleton

      def position(name, content = nil, action = nil)
        action = :insert_after if action.nil?
        case action
        when :insert_after
          content_blocks[name.to_sym] << content
        when :insert_before
          content_blocks[name.to_sym].unshift(content)
        when :update
          content_blocks[name.to_sym] = content
        end
      end

      def output(name)
        contents = content_blocks[name.to_sym]
        return nil if contents.empty?
        contents.join
      end

      protected

      def content_blocks
        @content_blocks ||= Hash.new { |h,k| h[k] = [] }
      end

    end
  end
end
