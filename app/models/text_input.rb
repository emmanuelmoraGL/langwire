# frozen_string_literal: true

class TextInput
  include ActiveAwsRecord::Base

  string_attr :contents
  string_attr :output_conll
end
