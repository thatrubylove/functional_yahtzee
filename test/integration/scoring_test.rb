require 'test_helper'
require 'scoring'

describe Yahtzee::Scoring do
  subject { Yahtzee::Scoring }

  describe "score(dice, placement)" do
    describe "UpperCard Scoring" do
      let(:game_card) { Yahtzee::ScoreCard.new }
      it "must keep state" do
        updater = ->(placement, value) {
          game_card.update!(placement => value)
        }
        card = subject.score([1,1,3,4,5], :aces, &updater)        
        card = subject.score([1,2,2,4,5], :twos, &updater)
        card.aces.must_equal 2
        card.twos.must_equal 4
      end
    end
  end
end

