# frozen_string_literal: true

module Parzu
  class Service
    extend Dry::Initializer
    extend Memoist

    param :record

    def extract_grammar
      response = client.query(record.contents)
      if response.success?
        conll_rows = Parser.new(response.body).parse
        conll_rows.map { |row| GrammarDescription.new(row) }
        record.update!(output_conll: conll_rows)
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
