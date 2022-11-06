# frozen_string_literal: true

class TextInput
  include Aws::Record
  include ::Identificable
  include ::Timestampable

  string_attr :contents
end
