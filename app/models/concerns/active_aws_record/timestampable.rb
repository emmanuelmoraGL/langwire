module ActiveAwsRecord
  module Timestampable
    extend ActiveSupport::Concern
    included do
      datetime_attr :created_at, default_value: Time.now
      datetime_attr :updated_at
    end

    def attrs_timestamps
      timestamp = Time.now
      { created_at: timestamp, updated_at: timestamp }
    end
  end
end
