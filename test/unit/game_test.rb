require 'test_helper'
require 'game'

describe Yahtzee::Game do
    subject { Yahtzee::Game.new }
    
    describe "score(dice, placement)" do
      it "must return a score card with the score and placement registered" do
        game = subject.score([1,2,3,4,5], :small_straight) 
        game.score_card[:lower][:small_straight].must_equal 30

        game = subject.score([1,2,3,3,3], :three_of_a_kind) 
        game.score_card[:lower][:three_of_a_kind].must_equal 9

        game = subject.score([1,2,3,3,3], :threes) 
        game.score_card[:upper][:threes].must_equal 9
      end
    end

    describe "place_key(placement)" do
      describe "with an unknown placement" do
        it "must blow chunks" do
          -> {
            subject.send(:placement_key, :not_a_valid_placement)
          }.must_raise Yahtzee::Errors::NotAScoreboardPlacementError
        end
      end
      describe "upper placements" do
        Yahtzee::Game.upper_scores.each do |key|
          it "must lookup the right nesting for #{key}" do
            subject.send(:placement_key, key).must_equal([
                         :upper, key])
          end
        end
      end

      describe "lower placements" do
        Yahtzee::Game.lower_scores.each do |key|
          it "must lookup the right nesting for #{key}" do
            subject.send(:placement_key, key).must_equal([
                         :lower, key])
          end
        end
      end
    end
  end

