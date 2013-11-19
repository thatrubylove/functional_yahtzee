require 'yahtzee'

module Yahtzee

  # I haven't exactly figured out what I want in here, it may 
  # enforce round rules, it may not. As of now it is a DSL method
  # to group rounds in a readable way
  class Round

    def initialize(&block)
      block.call
    end

  end
end
