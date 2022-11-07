# frozen_string_literal: true

module Parzu
  class Parser
    extend Dry::Initializer
    extend Memoist

    param :text

    def parse
      text.split("\n").map { |line| line.split("\t") }
    end
  end
end
