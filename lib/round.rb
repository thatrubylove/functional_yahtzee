require 'yahtzee'

module Yahtzee
  class Round

    def initialize(&block)
      block.call
    end

  end
end
