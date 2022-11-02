# frozen_string_literal: true

require "rails_helper"

describe TextInputs::TextInput::Component do
  let(:options) { { text_input: FactoryBot.create(:text_input) } }
  let(:component) { TextInputs::TextInput::Component.new(**options) }

  subject { rendered_component }

  it "renders" do
    render_inline(component)

    is_expected.to have_css "div"
  end
end
