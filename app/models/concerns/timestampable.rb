require "active_support/concern"

module Timestampable
  extend ActiveSupport::Concern
  included do
    string_attr :created_at, default_value: Time.now
    string_attr :updated_at
  end
end
