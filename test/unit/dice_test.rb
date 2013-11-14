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
  end

end
