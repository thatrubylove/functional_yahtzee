require 'test_helper'

require 'dice'

describe Yahtzee::Dice do
  subject { Yahtzee::Dice }

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
