require 'yahtzee'
require 'score_card'
require 'scoring/upper_card'
require 'scoring/lower_card'

# Yahtzee::Scoring is our mechnism for scoring dice
# to placement spots on the score card. If the method
# is located here, it will include a callback you can
# define. Right now it is used for writing the value
# to the object, but you could print the value instead.
# 
# Notice there is no direct coupling of type between this
# and the possible caller, just a contract on the params
module Yahtzee
  module Scoring

    extend UpperCard
    extend LowerCard   

    module_function    
    def score(dice, placement, &updater)
      value = send("score_#{placement.to_s}", dice)
      updater.call(placement, value)
    end

    def score_subtotal(scores, placement, &updater)
      value = reduce_values_from_hash(scores)
      updater.call(placement, value)
    end

    def score_upper_total(scores, &updater)
      subtotal = reduce_values_from_hash(scores)
      bonus = subtotal >= 63 ? 35 : 0
      updater.call(:upper_total, bonus+subtotal)
    end

    def score_game_total(scores, &updater)
      value = reduce_values_from_hash(scores)
      updater.call(:game_total, value)
    end

    def reduce_values_from_hash(hash)
      hash.values.compact.reduce(:+)
    end

  end
end

