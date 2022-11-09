# frozen_string_literal: true

class TextInput
  include ActiveAwsRecord::Base

  string_attr :contents
  string_attr :output_conll

  global_secondary_index(
    :recent_texts,
    hash_key: :updated_at,
    range_key: :uuid,
    projection: {
      projection_type: 'ALL'
    }
  )

  def parsed_output_conll
    output_conll ? JSON.parse(output_conll) : []
  end

  def self.recent_texts
    TextInput.build_scan
             .filter_expr(':updated_at > ?', 2.weeks.ago.iso8601)
             .complete!
             .page
  end
end
