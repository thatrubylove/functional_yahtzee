require 'test_helper'
require 'yahtzee/score_card'

describe Yahtzee::ScoreCard do
  subject { Yahtzee::ScoreCard }

  describe ".upper_keys" do
    subject { Yahtzee::ScoreCard.upper_keys }
    it "must contain all the keys on the upper card" do
      subject.must_equal [:aces, :twos, :threes, :fours, 
                          :fives, :sixes]
    end
  end

  describe ".lower_keys" do
    subject { Yahtzee::ScoreCard.lower_keys }
    it "must contain all the keys on the upper card" do
      subject.must_equal [:yahtzee, :bonus_yahtzee_1, :bonus_yahtzee_2, 
       :bonus_yahtzee_3, :three_of_a_kind,
       :four_of_a_kind, :full_house, :small_straight,
       :large_straight, :chance]
    end
  end

  describe ".placement_keys" do
    subject { Yahtzee::ScoreCard.placement_keys }
    it "must include all the placement keys" do
      subject.must_equal [:aces, :twos, :threes, :fours, :fives, 
                          :sixes, :small_straight, :large_straight, 
                          :full_house, :three_of_a_kind, :four_of_a_kind, 
                          :yahtzee, :chance]
    end
  end

  describe ".meta_keys" do
    subject { Yahtzee::ScoreCard.placement_keys }
    it "must include all the placement keys" do
      subject.must_equal [:aces, :twos, :threes, :fours, :fives, 
                          :sixes, :small_straight, :large_straight, 
                          :full_house, :three_of_a_kind, :four_of_a_kind, 
                          :yahtzee, :chance]
    end
  end

  describe ".persist" do
    subject { Yahtzee::ScoreCard.persist(score_card) }
    let(:score_card) { Yahtzee::ScoreCard.new( yahtzee: 50 ) }

    it "will return a new instance of ScoreCard with the old+new vals" do
      old_id = score_card.object_id
      score_card = subject.call(:small_straight, 30)
      score_card.object_id.wont_equal old_id
    end
  end

  describe "initialize" do
    it "will update attrs when passed in" do
      subject.new( {:aces => 4} ).aces.must_equal 4
    end
  end

  describe "to_hash" do
    it "must return a hash of the score card elements" do
      subject.new({aces: 4}).to_hash.must_equal({
        aces: 4, twos: nil, threes: nil,
        fours: nil, fives: nil, sixes: nil,
        upper_subtotal: nil,
        upper_total: nil, small_straight: nil,
        large_straight: nil, full_house: nil,
        three_of_a_kind: nil, four_of_a_kind: nil,
        yahtzee: nil, chance: nil, bonus_yahtzee_1: nil,
        bonus_yahtzee_2: nil, bonus_yahtzee_3: nil,
        lower_subtotal: nil, game_total: nil 
      })
    end
  end
end
