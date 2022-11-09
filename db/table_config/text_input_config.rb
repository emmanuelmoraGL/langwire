require 'aws-record'

module ModelTableConfig
  def self.config
    Aws::Record::TableConfig.define do |t|
      t.model_class TextInput

      t.read_capacity_units 2
      t.write_capacity_units 1

      t.global_secondary_index(:recent_texts) do |i|
        i.read_capacity_units 1
        i.write_capacity_units 1
      end
    end
  end
end
