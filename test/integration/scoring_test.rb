require 'test_helper'
require 'scoring'

describe Yahtzee::Scoring do
  subject { Yahtzee::Scoring }

  describe "score(dice, placement)" do
    describe "UpperCard Scoring" do
      let(:score_card) { Yahtzee::ScoreCard.new }
      let(:update_callback) {
        Yahtzee::ScoreCardUpdater.update(score_card)
      }

      it "must keep state" do
        card = subject.score([1,1,3,4,5], :aces, &update_callback)
        card.aces.must_equal 2
        card = subject.score([1,2,2,4,5], :twos, &update_callback)
        card.aces.must_equal 2
        card.twos.must_equal 4
        card = subject.score([4,4,4,4,4], :yahtzee, &update_callback)
        card.aces.must_equal 2
        card.twos.must_equal 4
        card.yahtzee.must_equal 50
      end
    end
  end
end

