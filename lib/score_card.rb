require 'yahtzee'

# Immutable via API, I will work on freezing this later,
# but notice that when you 'save' you are not altering
# THIS instance, you return a new instance with the old 
# and the new attributes
module Yahtzee
  SCORINGS = [:aces, :twos, :threes, 
              :fours, :fives, :sixes,
              :upper_subtotal, :upper_bonus, :upper_total,
              :small_straight, :large_straight, 
              :full_house, :three_of_a_kind, :four_of_a_kind,
              :yahtzee, :chance, :bonus_yahtzee_1,
              :bonus_yahtzee_2, :bonus_yahtzee_3,
              :lower_subtotal, :game_total]

  class ScoreCard < Struct.new(*SCORINGS)
    def initialize(attrs={})
      super *attrs.values_at(*self.class.members)
    end

    def to_hash
      Yahtzee::SCORINGS.reduce({}) do |hash, attr|
        hash.merge(attr => send(attr))
      end
    end

    def self.persist(score_card)
      ->(placement, value) {
        old_values = score_card.to_hash
        new_values = { placement => value }
        score_card = new(old_values.merge(new_values))
      }
    end
  end
end
