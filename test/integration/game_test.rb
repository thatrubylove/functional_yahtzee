require 'test_helper'
require 'game'

include Yahtzee

describe "Starting a new game" do
  it "will provide a functional core for playing yahtzee" do
    skip
    score_card = ScoreCard.new

    
    possible_places = [:aces, :twos, :threes, :fours,
                       :fives, :sixes, :three_of_a_kind,
                       :four_of_a_kind, :full_house,
                       :small_straight, :large_straight,
                       :yahtzee, :bonus_yahtzee_1,
                       :bonus_yahtzee_2, :bonus_yahtzee_3,
                       :chance]
    places_left = score_card.to_hash.select {|place| place.nil? }
    
    roll = Dice.roll(5)

      card_saver = ScoreCard.save(score_card)
      value_checker = ->(placement, value) { value }

      possible_scores = possible_places.reduce({}) do |hash, key|
        hash.merge( key => Scoring.score(roll, key, &value_checker) )
      end.reject {|_,v| v.nil? }

      best_possible_score_key = possible_scores.select {|k,v|
        v == possible_scores.values.max }.keys[0]

      score_card = Scoring.score(roll, best_possible_score_key, &card_saver)
  end
end
