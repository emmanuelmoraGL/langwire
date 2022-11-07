module Parzu
  class Client
    extend Dry::Initializer
    extend Memoist

    param :host

    def query(query_text)
      conn.get('parse/', 'text' => query_text)
    end

    def conn
      Faraday.new(host)
    end
    memoize :conn
  end
end
