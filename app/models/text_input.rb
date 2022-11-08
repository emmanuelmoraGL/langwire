# frozen_string_literal: true

class TextInput
  include ActiveAwsRecord::Base

  string_attr :contents
  string_attr :output_conll

  def parsed_output_conll
    output_conll ? JSON.parse(output_conll) : []
  end
end
