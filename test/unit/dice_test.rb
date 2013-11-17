require 'test_helper'

require 'dice'

describe Yahtzee::Dice do
  subject { Yahtzee::Dice }

  describe ".reroll(keepers)" do
    subject { Yahtzee::Dice.reroll([1,2,3]) }

    it "must return the keepers + the new roll" do
      subject.slice(0..2).must_equal([1,2,3])
    end

    it "must always return 5 digits" do
      [[1,2,3],[1,2],[1,2,3,4], [1,2,3,4,5,6]].each do |keepers|
        Yahtzee::Dice.reroll(keepers).count.must_equal 5
      end
    end
  end

  describe ".roll(num)" do
    1.upto(5).each do |roll|
      it "must retun #{roll} dice" do
        subject.roll(roll).size.must_equal roll
      end
    end

    it "wont allow rolls with more then 5 die" do
      subject.roll(6).size.must_equal(5)
    end

    it "must only roll 1-6" do
      subject.roll(6).each do |roll|
        (1..6).include?(roll).must_equal true
      end
    end
  end

end
