# frozen_string_literal: true

class TextInput
  include ActiveAwsRecord::Base

  string_attr :contents
  string_attr :output_conll

  def parsed_output_conll
    output_conll ? JSON.parse(output_conll) : []
  end

  def self.recent_texts
    TextInput.build_scan
             .filter_expr(':updated_at > ?', 2.weeks.ago.iso8601)
             .limit(10)
             .complete!
  end
end
