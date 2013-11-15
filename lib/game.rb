require 'yahtzee'

require 'score_card'
require 'scoring/upper_card'
require 'scoring/lower_card'

module Yahtzee
  class Game
    include Yahtzee::Errors
    include Scoring::UpperCard
    include Scoring::LowerCard

    attr_reader :score_card

    def initialize(score_card=ScoreCard.new)
      @score_card = score_card
    end
  
    def score(dice, placement)
      value = send("score_#{placement.to_s}", dice)
      Game.new(ScoreCard.new({placement.to_sym => value}))
    end

  end
end
