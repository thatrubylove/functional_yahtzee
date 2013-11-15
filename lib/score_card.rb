require 'yahtzee'

module Yahtzee
  SCORINGS = [:aces, :twos, :threes, 
              :fours, :fives, :sixes,
              :upper_subtotal, :upper_bonus, :upper_total,
              :small_straight, :large_straight, 
              :full_house, :three_of_a_kind, :four_of_a_kind,
              :yahtzee, :bonus_yahtzees, :chance,
              :lower_subtotal, :grand_total]

  class ScoreCard < Struct.new(*SCORINGS)
    def initialize(attrs={})
      super *attrs.values_at(*self.class.members)
    end
  end
end
