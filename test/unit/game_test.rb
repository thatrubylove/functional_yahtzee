require 'test_helper'
require 'yahtzee/game'

describe Yahtzee::Game do
  subject { Yahtzee::Game }
  
  describe "first_roll" do
    it "must roll the dice and return the roll" do
      subject.first_roll.must_be_kind_of Array
    end
  end

  describe "second_roll(keepers)" do
    let(:keepers) { [1,2,3] }
    it "must keep the die they want and reroll the rest" do
      (subject.second_roll(keepers) & [1,2,3]).must_equal keepers
    end
  end

  describe "third_roll(keepers)" do
    let(:keepers) { [1,2,3,4] }
    it "must keep the die they want and reroll the rest" do
      (subject.third_roll(keepers) & [1,2,3,4]).must_equal keepers
    end
  end
end

