# frozen_string_literal: true

module Parzu
  class Client
    extend Dry::Initializer
    extend Memoist

    param :host

    def query(query_text)
      conn.get('parse/', 'text' => query_text)
    end

    def conn
      Faraday.new(host) do |conn|
        conn.options.timeout = 30
      end
    end
    memoize :conn
  end
end
