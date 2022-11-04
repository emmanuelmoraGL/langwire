require 'aws-record'

class TextInput
  include Aws::Record

  string_attr :uuid, hash_key: true
  string_attr :contents
  string_attr :created_at
  string_attr :updated_at
end
