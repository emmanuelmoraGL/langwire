require 'active_support/concern'

module Identificable
  extend ActiveSupport::Concern
  included do
    string_attr :uuid, hash_key: true, default_value: SecureRandom.uuid
  end
end
