module ActiveAwsRecord
  module Identificable
    extend ActiveSupport::Concern
    included do
      string_attr :uuid, hash_key: true, default_value: SecureRandom.uuid

      alias_method :id, :uuid

      def initialize(attr_values = {})
        super(attr_values.merge(uuid: SecureRandom.uuid))
      end
    end
  end
end
