require 'test_helper'
require 'score_card'
require 'score_card_updater'


describe Yahtzee::ScoreCardUpdater do

  describe "update" do
    subject { Yahtzee::ScoreCardUpdater.update(score_card) }
    let(:score_card) { Yahtzee::ScoreCard.new( yahtzee: 50 ) }

    it "will return a new instance of ScoreCard with the old+new vals" do
      old_id = score_card.object_id
      score_card = subject.call(:small_straight, 30)
      score_card.object_id.wont_equal old_id
    end
  end
end

