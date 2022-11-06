# frozen_string_literal: true

class TextOutput
  include Aws::Record
  include ::Identificable
  include ::Timestampable

  string_attr :text
  string_attr :format
end
