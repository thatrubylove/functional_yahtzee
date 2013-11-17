require 'yahtzee'
require 'score_card'
require 'score_card_updater'
require 'scoring/upper_card'
require 'scoring/lower_card'

module Yahtzee
  module Scoring
    require 'game' # needs Yahtzee::Scoring defined first :)

    extend UpperCard
    extend LowerCard   

    module_function    
    def score(dice, placement, &updater)
      value = send("score_#{placement.to_s}", dice)
      updater.call(placement, value)      
    end

    def score_subtotal(scores, placement, &updater)
      value = scores.values.compact.inject(:+)
      updater.call(placement, value)
    end

    def score_upper_total(scores, &updater)
      subtotal = scores.values.reduce(:+)
      bonus = subtotal >= 63 ? 35 : 0
      updater.call(:upper_total, bonus+subtotal)
    end

    def score_game_total(scores, &updater)
      value = scores.values.reduce(:+)
      updater.call(:game_total, value)
    end

  end
end

