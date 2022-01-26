require_relative '../clients/json'

module Cats
  module Shops
    class CatsUnlimited
      CACHE_TTL = 1.day

      def self.build_record(record)
        ::Cats::Record.new(
          name: record['name'],
          price: record['price'],
          location: record['location'],
          image: record['image']
        )
      end

      def initialize(client: ::Cats::Clients::Json.new, url: ENV['CATS_UNLIMITED_API_URL'])
        @client = client
        @url = url
      end

      def call
        Rails.cache.fetch('sources:cats-unlimited:result', expires_in: CACHE_TTL) do
          records = client.call(url)
          records.map { |record| self.class.build_record(record) }
        end
      end

      private

        attr_reader :client, :url
    end
  end
end
