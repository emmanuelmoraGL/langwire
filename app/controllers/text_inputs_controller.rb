class TextInputsController < ApplicationController
  skip_forgery_protection

  before_action :set_text_input, only: %i[destroy]

  def index
    @text_inputs = TextInput.recent_texts.page
  end

  def visualization
    @text_input = TextInput.find(uuid: params[:text_input_id])
    broadcast_visualization

    respond_to do |format|
      format.turbo_stream
    end
  end

  def create
    create_record
    extract_grammar

    broadcast(@text_input, ::TextInputs::TextInput::Component).prepend

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @text_input.delete!
    broadcast(@text_input, ::TextInputs::TextInput::Component).remove

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def broadcast_visualization
    Turbo::StreamsChannel.broadcast_replace_later_to(
      'text_inputs',
      target: params[:target],
      html: ApplicationController.render(
        select_show_component.new(
          conll_arr: @text_input.parsed_output_conll,
          text_input_id: @text_input.id
        ),
        layout: false
      )
    )
  end

  def select_show_component
    { 'grammar_table' => GrammarTable::Component }[params[:visualization]]
  end

  def create_record
    @text_input = TextInput.new(contents: params[:contents])
    @text_input.save!
  end

  def extract_grammar
    @grammar = Parzu::Service.new(@text_input).extract_grammar
  end

  def broadcast(component_input, component)
    Broadcast::Strategies::Simple.new(
      component_input,
      component
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
