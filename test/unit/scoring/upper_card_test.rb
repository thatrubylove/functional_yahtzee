require 'test_helper'
require 'score_card'
require 'scoring/upper_card'

describe Yahtzee::Scoring::UpperCard do
  subject { Yahtzee::Scoring::UpperCard }

  describe "score_sums(dice, scoring_die)" do
    it "must add up only the scoring_die" do
      subject.score_sums([1,1,0,0,0], 1).must_equal 2
      subject.score_sums([1,1,4,4,1], 1).must_equal 3
    end
  end

  describe "scoring matching digits" do
    describe "score_aces(dice)" do
      it "must score only aces" do
        subject.score_aces([1,2,3,4,5]).must_equal(1)
      end
    end

    describe "score_twos(dice)" do
      it "must score only twos" do
        subject.score_twos([1,2,3,4,5]).must_equal(2)
      end
    end

    describe "score_threes(dice)" do
      it "must score only threes" do
        subject.score_threes([1,2,3,4,5]).must_equal(3)
      end
    end

    describe "score_fours(dice)" do
      it "must score only fours" do
        subject.score_fours([1,2,3,4,5]).must_equal(4)
      end
    end

    describe "score_fives(dice)" do
      it "must score only fives" do
        subject.score_fives([1,2,3,4,5]).must_equal(5)
      end
    end

    describe "score_sixes(dice)" do
      it "must score only sixes" do
        subject.score_sixes([1,2,3,4,6]).must_equal(6)
      end
    end
  end
end
