require 'rss'
require 'open-uri'

module Consul
  module Conversations
    class RssPresenter
      def initialize(url)
        @url = url
      end

      def call
        RSS::Parser.parse(open(@url))
      end
    end
  end
end
