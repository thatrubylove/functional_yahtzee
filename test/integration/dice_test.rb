require 'test_helper'

require 'yahtzee/dice'

describe "A turn of dice rolling" do
  subject { Yahtzee::Dice }

  it "will return 5 new dice values" do
    subject.roll(5).count.must_equal 5
  end

  it "will play a turn to a large straight" do
    roll_1 = [1,2,3,6,6]

    roll_2 = subject.reroll(roll_1[0..2])
    roll_3 = roll_2[0..2] + [4,5]

    roll_3.must_equal (1..5).to_a
  end
end
