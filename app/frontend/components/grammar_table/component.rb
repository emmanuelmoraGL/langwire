# frozen_string_literal: true

class GrammarTable::Component < ApplicationViewComponent
  include ActionView::RecordIdentifier

  with_collection_parameter :conll_arr
  option :conll_arr
end
