require 'aws-record'

class GraphicalOutput
  include Aws::Record

  string_attr :uuid, hash_key: true
  string_attr :name
  string_attr :url
  string_attr :format
end
