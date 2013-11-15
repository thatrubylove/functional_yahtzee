require 'test_helper'
require 'score_card'

describe Yahtzee::ScoreCard do
  subject { Yahtzee::ScoreCard }

  describe "initialize" do
    it "will update attrs when passed in" do
      subject.new( {:aces => 4} ).aces.must_equal 4
    end
  end
end
