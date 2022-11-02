require "rails_helper"

RSpec.describe "text_inputs/index", type: :view do
  before do
    assign(:text_inputs, [
      TextInput.create!,
      TextInput.create!
    ])
  end

  it "renders a list of text_inputs" do
    render
  end
end
