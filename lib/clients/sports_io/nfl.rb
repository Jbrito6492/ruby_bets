require 'faraday'

module Clients
  module SportsIo
    class Nfl
      BASE_URL = 'https://api.sportsdata.io/v3/nfl/'
      attr_reader :api_key, :adapter

      def initialize(api_key: ENV['SPORTSIO_API_KEY'], adapter: Faraday.default_adapter)
        @api_key = api_key
        @adapter = adapter
      end

      def connection
        @connection ||= Faraday.new do |conn|
          conn.url_prefix = BASE_URL
          conn.headers['Ocp-Apim-Subscription-Key'] = api_key
          conn.request :json
          conn.response :json, content_type: /\bjson$/
          conn.adapter adapter
        end
      end

      def inspect
        '#<SportsIo::Client>'
      end

      def games
        connection.get("scores/json/Schedules/#{DateTime.now.year}").body.each { |game| game.deep_symbolize_keys! }
      end
    end
  end
end
