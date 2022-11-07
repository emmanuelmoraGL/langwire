class TextInputs::TextInput::Component < ApplicationViewComponent
  include ActionView::RecordIdentifier

  with_collection_parameter :text_input
  option :text_input

  private

  delegate :contents, :created_at, to: :text_input, prefix: true

  def recent_text_input?
    text_input.created_at > 1.minute.ago
  end

  def timestamp
    text_input.created_at.strftime("%Y-%m-%d at %H:%M")
  end

  def conll_field_names
    Parzu::GrammarDescription::FIELDS.map { |sym| sym.to_s.upcase }
  end
end
