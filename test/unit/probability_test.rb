require 'test_helper'
require 'probability'

describe Yahtzee::Probability do
  subject { Yahtzee::Probability }

  describe "large_straight(dice, rolls_left)" do
    it "must return 0.3333333333333333 with 2 rolls left" do
      subject.large_straight([1,2,3,4,6], 2).must_equal(0.3333333333333333)
    end

    it "must return 0.16666666666666666 with 1 rolls left" do
      subject.large_straight([1,2,3,4,6], 1).must_equal(0.16666666666666666)
    end

    it "must return 0.03333333333333333 with 1 rolls left" do
      subject.large_straight([1,2,2,6,6], 1).must_equal(0.03333333333333333)
    end
  end

  describe "small_straight(dice, rolls_left)" do
    it "must return 0.16666666666666666 with 2 rolls left" do
      subject.small_straight([1,2,3,5,6], 2).must_equal(0.16666666666666666)
    end

    it "must return 0.08333333333333333 with 1 rolls left" do
      subject.small_straight([1,2,3,5,6], 1).must_equal(0.08333333333333333)
    end

    it "must return 0.03333333333333333 with 1 rolls left" do
      subject.small_straight([1,2,5,5,6], 1).must_equal(0.03333333333333333)
    end
  end
end

