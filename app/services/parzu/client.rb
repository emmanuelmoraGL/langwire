module Parzu
  class Client
    extend Dry::Initializer
    extend Memoist

    param :host

    class << self
      def default
        @instance ||= new(Rails.application.config.parzu_host)
      end
    end

    def query(query_text)
      conn.get('parse/', 'text' => query_text)
    end

    def conn
      Faraday.new(host)
    end
    memoize :conn
  end
end
