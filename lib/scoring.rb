require 'yahtzee'
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
      Yahtzee::Game.new(
        Yahtzee::ScoreCard.new({placement.to_sym => value}))
    end
  end
end

