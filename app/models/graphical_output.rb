# frozen_string_literal: true

class GraphicalOutput
  include Aws::Record
  include ::Identificable
  include ::Timestampable

  string_attr :name
  string_attr :url
  string_attr :format
end
