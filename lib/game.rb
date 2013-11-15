require 'yahtzee'

require 'score_card'
require 'scoring'

module Yahtzee
  class Game
    include Yahtzee::Errors
    include Yahtzee::Scoring

    attr_reader :score_card

    def initialize(score_card=ScoreCard.new)
      @score_card = score_card
    end 

  end
end
