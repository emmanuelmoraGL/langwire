module ActiveAwsRecord
  module TablePrefixed
    extend ActiveSupport::Concern
    included do
      set_table_name "langwire_prod_#{model_name.plural}"
    end
  end
end
