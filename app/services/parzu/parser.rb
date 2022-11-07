module Parzu
  module Parser
    extend Dry::Initializer
    extend Memoist

    param :sentence

    def parse
      sentence.split('\n').map{ |l| split('\t') }
    end
  end
end
