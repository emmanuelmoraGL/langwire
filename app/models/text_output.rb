# frozen_string_literal: true

class TextOutput
  include ActiveAwsRecord::Base
  string_attr :text
  string_attr :format
end
