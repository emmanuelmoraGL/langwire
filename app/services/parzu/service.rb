module Parzu
  class Service
    extend Dry::Initializer
    extend Memoist

    param :text

    def extract_grammar
      response = client.query(text)
      if response.success?
        connl_rows = Parser.new(response.body).parse
        connl_rows.map { |row| GrammarDescription.new(row) }
      else
        []
      end
    end

    private

    def client
      Client.new(Rails.application.config.parzu_host)
    end
    memoize :client
  end
end
