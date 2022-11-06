module ActiveAwsRecord
  module Timestampable
    extend ActiveSupport::Concern
    included do
      datetime_attr :created_at, default_value: Time.now
      datetime_attr :updated_at
    end

    def initialize(attr_values = {})
      timestamp = Time.now
      super({ created_at: timestamp, updated_at: timestamp }.merge(attr_values))
    end
  end
end
