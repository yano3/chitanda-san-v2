require 'faraday'
require 'faraday_middleware'

module ChitandaSan
  module SyoboiCalendar
    module Connection
      def get(uri, params = nil)
        request(:get, uri, params)
      end

      def request(method, uri, params)
        connection.send(method, uri, params)
      end

      def connection
        @connection ||= Faraday.new(url: @base_url) do |config|
          config.response :xml
          config.adapter :net_http
        end
      end
    end
  end
end
