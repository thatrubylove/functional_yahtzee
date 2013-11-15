require 'yahtzee'

module Yahtzee::Scoring
  module LowerCard
    module_function

    def score_full_house(dice)
      sorted = dice.sort
      if sorted.count(sorted.first) + sorted.count(sorted.last) == 5
        25
      else
        0
      end
    end

    def score_small_straight(dice)
      dup = dice.sort.uniq.dup
      (dup.min.upto(dup.max).to_a <=> dup) == 0 ? 30 : 0
    end

    def score_large_straight(dice)
      dup = dice.sort.dup
      (dup.min.upto(dup.max).to_a <=> dup) == 0 ? 40 : 0
    end

    def score_yahtzee(dice)
      dice.uniq.count == 1 ? 50 : 0
    end

    def score_bonus_yahtzee(dice)
      dice.uniq.count == 1 ? 100 : 0
    end

    def score_three_of_a_kind(dice)
      score_min_of_a_kind(dice, 3)
    end

    def score_four_of_a_kind(dice)
      score_min_of_a_kind(dice, 4)
    end

    def score_min_of_a_kind(dice, min)
      value = max_dupe_count_as_hash(dice)
      value[0] >= min ? value.reduce(:*) : 0
    end

    def dup_counts_as_hash(dice)
      dice.each_with_object(Hash.new(0)) {|o, h| h[o] += 1 }
    end

    def max_dupe_count_as_hash(dice)
      dup_counts_as_hash(dice).max_by {|_,v| v }
    end
  end
end

