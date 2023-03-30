# frozen_string_literal: true

require 'faraday'

module Clients
  module SportsIo
    class Nfl
      BASE_URL = 'https://api.sportsdata.io/v3/nfl/'
      attr_reader :api_key, :adapter

      def initialize(api_key: ENV['SPORTSIO_API_KEY'])
        @api_key = api_key
      end

      def headers
        {
          'Ocp-Apim-Subscription-Key' => @api_key
        }
      end

      def connection
        @connection ||= Faraday.new(BASE_URL) do |conn|
          conn.headers = headers
          conn.request :json, content_type: /\bjson$/
          conn.response :json, content_type: /\bjson$/
          conn.response :raise_error, error_prefix: 'SportsIo::Nfl'
          conn.adapter Faraday.default_adapter
        end
      end

      def inspect
        '#<SportsIo::Client>'
      end

      def games
        connection.get("scores/json/Schedules/#{DateTime.now.year}").body.each(&:deep_symbolize_keys!)
      rescue Faraday::ClientError => e
        Rails.logger.error "SportsIo::Nfl#games: #{e.message}"
      end
    end
  end
end
