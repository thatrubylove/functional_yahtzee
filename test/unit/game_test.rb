require 'test_helper'
require 'game'

describe Yahtzee::Game do
  subject { Yahtzee::Game.new }
  
  describe "score(dice, placement)" do
    it "must return a score card with the score and placement registered" do
      game = subject.score([1,2,3,4,5], :small_straight) 
      game.score_card.small_straight.must_equal 30

      game = subject.score([1,2,3,3,3], :three_of_a_kind) 
      game.score_card.three_of_a_kind.must_equal 9

      game = subject.score([1,2,3,3,3], :threes) 
      game.score_card.threes.must_equal 9
    end
  end
end

