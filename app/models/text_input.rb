# frozen_string_literal: true

class TextInput
  include ActiveAwsRecord::Base

  string_attr :contents
  string_attr :output_conll
  integer_attr :user_id

  global_secondary_index(
    :recent_texts,
    hash_key: :user_id,
    range_key: :updated_at,
    projection: {
      projection_type: 'INCLUDE',
      non_key_attributes: ['contents']
    }
  )

  def parsed_output_conll
    output_conll ? JSON.parse(output_conll) : []
  end

  def self.recent_texts
    TextInput.build_query
             .on_index(:recent_texts)
             .key_expr(':user_id = ? AND :updated_at > ?', 1, 2.weeks.ago.iso8601)
             .scan_ascending(false)
             .limit(10)
             .complete!
  end

  def initialize(attr_values = {})
    attr_values.merge!(attrs_users)
    attr_values.merge!(attrs_identifier)
    attr_values.merge!(attrs_timestamps)
    super(attr_values)
  end

  def attrs_users
    # Harcoded value because there is no user management yet.
    { user_id: 1 }
  end
end
