require 'yahtzee'
require 'game'
require 'score_card'
require 'scoring/upper_card'
require 'scoring/lower_card'

module Yahtzee
  module Scoring
    include UpperCard
    include LowerCard

    def score(dice, placement)
      value = send("score_#{placement.to_s}", dice)
      Yahtzee::Game.new(
        Yahtzee::ScoreCard.new({placement.to_sym => value}))
    end
  end
end

