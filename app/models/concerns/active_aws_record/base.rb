module ActiveAwsRecord
  module Base
    extend ActiveSupport::Concern
    included do
      include Aws::Record
      extend ActiveModel::Naming
      include ActiveModel::Conversion
      include Identificable
      include Timestampable
      include TablePrefixed
    end
  end
end
