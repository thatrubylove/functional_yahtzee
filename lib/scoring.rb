require_relative 'yahtzee'
require 'scoring/upper_card'
require 'scoring/lower_card'


module Yahtzee::Scoring
  class Card
    include UpperCard
    include LowerCard

    attr_reader :score_card

    def initialize(attrs={})
      @score_card = blank_card.inject(attrs) do |hash, key| 
        hash[key] = attrs
      end
    end

    def self.upper_scores
      [:aces, :twos, :threes, :fours, :fives, :sixes]
    end

    def self.lower_scores
      [:three_of_a_kind, :four_of_a_kind, :full_house,
       :small_straight, :large_straight, :yahztee, :chance]
    end

    def blank_card
      {
        upper: {
          aces:   nil,
          twos:   nil,
          threes: nil,
          fours:  nil,
          fives:  nil,
          sixes:  nil
        },
        lower: {
          three_of_a_kind: nil,
          four_of_a_kind: nil,
          small_straight: nil,
          large_straight: nil,
          yahztee: nil,
          chance: nil
        }
      }
    end

    def score(dice, placement)
      value = send("score_#{placement.to_s}", dice)
      section, key = placement_key(placement)
      Card.new({section.to_sym => {key.to_sym => value}}).score_card
    end

  private

    def placement_key(placement)
      if Card.upper_scores.include? placement
        return [:upper, :"#{placement}"]
      end
      if Card.lower_scores.include? placement
        return [:lower, :"#{placement}"]
      end
      raise Exception.new("#{placement} is not in score card!")
    end
  end
end
