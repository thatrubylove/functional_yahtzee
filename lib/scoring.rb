require 'yahtzee'
require 'score_card'
require 'scoring/upper_card'
require 'scoring/lower_card'

module Yahtzee
  module Scoring
    require 'game' # needs Yahtzee::Scoring defined first :)

    extend UpperCard
    extend LowerCard   

    module_function    
    def score(dice, placement)
      value = send("score_#{placement.to_s}", dice)
      new_game_with_a_new_card(placement, value)      
    end

    def score_subtotal(scores, placement)
      value = scores.values.compact.inject(:+)
      new_game_with_a_new_card(placement, value)
    end

    def new_game_with_a_new_card(placement, value)
      Yahtzee::Game.new(
        Yahtzee::ScoreCard.new({placement.to_sym => value}))
    end
  end
end

