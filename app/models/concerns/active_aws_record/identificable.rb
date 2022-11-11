module ActiveAwsRecord
  module Identificable
    extend ActiveSupport::Concern
    included do
      string_attr :uuid, hash_key: true

      alias_method :id, :uuid

      def attrs_identifier
        { uuid: SecureRandom.uuid }
      end
    end
  end
end
