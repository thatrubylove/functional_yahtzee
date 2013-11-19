require 'test_helper'
require 'yahtzee/scoring/lower_card'

describe Yahtzee::Scoring::LowerCard do
  subject { Yahtzee::Scoring::LowerCard }

  describe "score_yahtzee(dice)" do
    it "must score a yahtzee" do
      subject.score_yahtzee([4,4,4,4,4]).must_equal 50
      subject.score_yahtzee([4,4,4,4,6]).must_equal 0
    end
  end

  describe "score_bonus_yahtzee(dice)" do
    it "must score a bonus yahtzee" do
      subject.score_bonus_yahtzee([4,4,4,4,4]).must_equal 100
      subject.score_bonus_yahtzee([4,4,4,4,6]).must_equal 0
    end

    #1.upto(3) do |i|
    #  it "must respond to score_bonus_yahtzee_#{i}" do
    #    subject.send("score_bonus_yahtzee_#{i}",[4,4,4,4,4]).must_equal 100
    #  end
    #end
  end

  describe "score_small_straight(dice)" do
    it "must score a small straight" do
      subject.score_small_straight([1,2,3,4,6]).must_equal 30
      subject.score_small_straight([1,2,3,5,6]).must_equal 0
    end
  end

  describe "score_large_straight(dice)" do
    it "must score a large straight" do
      subject.score_large_straight([1,2,3,4,5]).must_equal 40
      subject.score_large_straight([1,2,3,4,4]).must_equal 0
    end
  end
  
  describe "score_full_house(dice)" do
    it "must return a score of 25 for a full house" do
      subject.score_full_house([2,2,2,4,4]).must_equal 25
    end

    it "must return a score of 0 for no full-house" do
      subject.score_full_house([1,2,4,4,4]).must_equal 0
    end
  end

  describe "score_three_of_a_kind(dice)" do
    it "must total matches 3 or over" do
      subject.score_three_of_a_kind([1,2,4,4,4]).must_equal 12
      subject.score_three_of_a_kind([1,2,2,4,4]).must_equal 0
    end
  end

  describe "score_four_of_a_kind(dice)" do
    it "must total matches 4 or over" do
      subject.score_four_of_a_kind([1,4,4,4,4]).must_equal 16
      subject.score_four_of_a_kind([1,2,2,4,4]).must_equal 0
    end
  end

  describe "score_min_of_a_kind(dice, min)" do
    it "must total matches of min or over" do
      subject.score_min_of_a_kind([1,4,4,4,4], 4).must_equal 16
      subject.score_min_of_a_kind([1,2,4,4,4], 3).must_equal 12
    end
  end
end
