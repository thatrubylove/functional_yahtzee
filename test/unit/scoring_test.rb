require 'test_helper'
require 'scoring'

describe Yahtzee::Scoring::Card do
    subject { Yahtzee::Scoring::Card.new }
    
    describe "score(dice, placement)" do
      it "must return a score card with the score and placement registered" do
        score_card = subject.score([1,2,3,4,5], :small_straight) 
        score_card[:lower][:small_straight].must_equal 30

        score_card = subject.score([1,2,3,3,3], :three_of_a_kind) 
        score_card[:lower][:three_of_a_kind].must_equal 9

        score_card = subject.score([1,2,3,3,3], :threes) 
        score_card[:upper][:threes].must_equal 9
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
        Yahtzee::Scoring::Card.upper_scores.each do |key|
          it "must lookup the right nesting for #{key}" do
            subject.send(:placement_key, key).must_equal([
                         :upper, key])
          end
        end
      end

      describe "lower placements" do
        Yahtzee::Scoring::Card.lower_scores.each do |key|
          it "must lookup the right nesting for #{key}" do
            subject.send(:placement_key, key).must_equal([
                         :lower, key])
          end
        end
      end
    end
  end

