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
    end
  end

