require 'yahtzee'
require 'dice'
require 'round'
require 'scoring'

# This module is the imperative shell of sorts. It provides
# the 'DSL' of the Yahtzee library and is mostly a wrapper
# for internals, 'gluing' the application together from a
# bunch of functions into a cohesive playable game.
#
module Yahtzee
  module Game
    include Yahtzee::Errors
    include Yahtzee::Scoring
    include Yahtzee::Dice

    module_function

    def first_roll
      Dice.roll(5)
    end

    def second_roll(keepers)
      Dice.reroll(keepers)
    end
    # tricky - todo: alias_method :third_roll, :second_roll
    
    def third_roll(keepers)
      Dice.reroll(keepers)
    end

  end
end
