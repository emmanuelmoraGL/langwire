require 'aws-record'

class TextOutput
  include Aws::Record

  string_attr :uuid, hash_key: true
  string_attr :text
  string_attr :format
  string_attr :created_at
  string_attr :updated_at
end
