require 'test_helper'
require 'game'

include Yahtzee

describe "Starting a new game" do
  it "will provide a functional core for playing yahtzee" do
    score_card = ScoreCard.new

    roll = Dice.roll(5)

    possible_places = [:aces, :twos, :threes, :fours,
                       :fives, :sixes, :three_of_a_kind,
                       :four_of_a_kind, :full_house,
                       :small_straight, :large_straight,
                       :yahtzee, :bonus_yahtzee_1,
                       :bonus_yahtzee_2, :bonus_yahtzee_3,
                       :chance]
    places_left = score_card.to_hash.select {|place| place.nil? }
    possible_scores = places_left.reduce({}) do |k,v|
      begin
        score(roll, k, v)
      rescue
      end
    end
  end
end
