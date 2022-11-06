# frozen_string_literal: true

class TextInput
  include ActiveAwsRecord::Base

  string_attr :contents
end
