require 'yahtzee'

module Yahtzee::Scoring
  module UpperCard
    module_function

    def score_aces(dice)
      score_sums(dice, 1)
    end

    def score_twos(dice)
      score_sums(dice, 2)
    end

    def score_threes(dice)
      score_sums(dice, 3)
    end

    def score_fours(dice)
      score_sums(dice, 4)
    end

    def score_fives(dice)
      score_sums(dice, 5)
    end

    def score_sixes(dice)
      score_sums(dice, 6)
    end

    def score_sums(dice, scoring_die)
      dice.select {|die| die == scoring_die}.reduce(:+)
    end

  end
end
