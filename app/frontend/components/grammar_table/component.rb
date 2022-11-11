# frozen_string_literal: true

class GrammarTable::Component < ApplicationViewComponent
  include ActionView::RecordIdentifier

  option :conll_arr
  option :text_input_id

  def conll_field_names
    Parzu::GrammarDescription::FIELDS.map { |sym| sym.to_s.upcase }
  end
end
