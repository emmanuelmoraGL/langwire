# frozen_string_literal: true

module Parzu
  class Service
    extend Dry::Initializer
    extend Memoist

    param :record

    def extract_grammar
      download_conll
      download_graphical
    end

    private

    def download_conll
      response = parzu_client.query(record.contents)
      if response.success?
        conll_rows = Parser.new(response.body).parse
        conll_rows.map { |row| GrammarDescription.new(row) }
        record.update!(output_conll: conll_rows)
      else
        []
      end
    end

    def download_graphical
      response = parzu_client.query(record.contents, format: 'graphical')
      return unless response.success?

      s3_client.put_object(
        {
          body: response.body,
          key: "text_input_#{record.id}.svg",
          bucket: Rails.application.config.s3_bucket,
          content_type: "image/svg+xml"
        }
      )
    end

    def parzu_client
      Client.new(Rails.application.config.parzu_host)
    end
    memoize :parzu_client

    def s3_client
      Aws::S3::Client.new
    end
    memoize :s3_client
  end
end
