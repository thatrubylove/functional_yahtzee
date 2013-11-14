require_relative 'yahtzee'
require 'scoring/upper_card'
require 'scoring/lower_card'


module Yahtzee::Scoring
  class Card
    include UpperCard
    include LowerCard

    def blank_card
      {
        upper: [
          aces:   nil,
          twos:   nil,
          threes: nil,
          fours:  nil,
          fives:  nil,
          sixes:  nil
        ],
        lower: [
          three_of_a_kind: nil,
          four_of_a_kind: nil,
          small_straight: nil,
          large_straight: nil,
          yahztee: nil,
          chance: nil
        ]
      }
    end

    def score(dice, place)
      blank_card.merge( place_key(place) => send("score_#{place}", dice) )
    end

    def place_key(place)
      return "upper[#{place}]" if upper_scores.include? place
      return "lower[#{place}]" if lower_scores.include? place
      raise Exception.new("#{place} is not in score card!")
    end

    def upper_scores
      [:aces, :twos, :threes, :fours, :fives, :sixes]
    end

    def lower_scores
      [:three_of_a_kind, :four_of_a_kind,
       :small_straight, :large_straight,
       :yahztee, :chance]
    end

  end
end
