require 'test_helper'
require 'scoring'

describe Yahtzee::Scoring do
  subject { Yahtzee::Scoring }

  describe "score(dice, placement)" do
    describe "UpperCard Scoring" do
      let(:score_card) { Yahtzee::ScoreCard.new }
      let(:save_card)  { Yahtzee::ScoreCard.save(score_card) }
      it "must keep state" do
        card = subject.score([1,1,3,4,5], :aces, &save_card)
        card = subject.score([1,2,2,4,5], :twos, &save_card)
        card.aces.must_equal 2
        card.twos.must_equal 4
      end
    end
  end
end

