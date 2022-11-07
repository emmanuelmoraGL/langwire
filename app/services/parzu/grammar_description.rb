module Parzu
  class GrammarDescription
    extend Dry::Initializer

    #description: https://github.com/rsennrich/ParZu/blob/master/doc/CONLL.md
    Fields = [:id, :form, :lemma, :cpostag, :postag, :feats, :head, :deprel, :phead, :pdeprel]

    param :connl_x_row

    Fields.each.with_index do |field, i|
      define_method field do
        connl_x_row[i]
      end
    end
  end
end
