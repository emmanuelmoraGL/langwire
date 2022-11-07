# frozen_string_literal: true

module Parzu
  class GrammarDescription
    extend Dry::Initializer

    # description: https://github.com/rsennrich/ParZu/blob/master/doc/CONLL.md
    FIELDS = %i[
      id
      form
      lemma
      cpostag
      postag
      feats
      head
      deprel
      phead
      pdeprel
    ].freeze

    param :connl_x_row

    delegate :to_json, to: :attributes

    FIELDS.each.with_index do |field, i|
      define_method field do
        connl_x_row[i]
      end
    end

    def attributes
      FIELDS.each_with_object({}) do |field, obj|
        obj[field] = send(field)
      end
    end
    alias as_json attributes
  end
end
