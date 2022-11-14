# frozen_string_literal: true

class GrammarTable::Component < ApplicationViewComponent
  option :conll_arr
  option :text_input_id

  def conll_fields
    Parzu::GrammarDescription::FIELDS
  end
end
