class TextInputsController < ApplicationController
  skip_forgery_protection

  before_action :set_text_input, only: %i[destroy]

  def index
    @text_inputs = TextInput.scan.to_a
  end

  def create
    @text_input = TextInput.new(contents: params[:contents])
    @text_input.save!
    broadcast.prepend

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @text_input.delete!
    broadcast.remove

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def broadcast
    Broadcast::Strategies::Simple.new(
      @text_input,
      ::TextInputs::TextInput::Component
    )
  end

  def set_text_input
    @text_input = TextInput.query(
      key_condition_expression: '#H = :h',
      expression_attribute_names: {
        '#H' => 'uuid'
      },
      expression_attribute_values: {
        ':h' => params[:id]
      }
    ).first
  end

  def text_input_params
    params.fetch(:text_input, {})
  end
end
