class TextInputsController < ApplicationController
  skip_forgery_protection

  before_action :set_text_input, only: %i[destroy]

  def index
    @text_inputs = TextInput.all.order(created_at: :desc)
  end

  def create
    @text_input = TextInput.create!(contents: params[:contents])
    broadcast.prepend

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @text_input.destroy!
    broadcast.remove

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def broadcast
    @broadcast ||= Broadcast::Strategies::Simple.new(
      @text_input,
      ::TextInputs::TextInput::Component
    )
  end

  def set_text_input
    @text_input = TextInput.find(params[:id])
  end

  def text_input_params
    params.fetch(:text_input, {})
  end
end
