require 'test_helper'
require 'scoring'

describe Yahtzee::Scoring do
  subject { Yahtzee::Scoring }

  describe "score(dice, placement)" do
    describe "UpperCard Scoring" do
      describe "Aces" do
        let(:game) { subject.score([1,1,3,4,5], :aces) }
        it "must return a score card with aces: 2" do
          game.score_card.aces.must_equal 2
        end
      end

      describe "Twos" do
        let(:game) { subject.score([1,2,2,4,5], :twos) }
        it "must return a score card with twos: 4" do
          game.score_card.twos.must_equal 4
        end
      end

      describe "Threes" do
        let(:game) { subject.score([1,3,3,4,5], :threes) }
        it "must return a score card with threes: 6" do
          game.score_card.threes.must_equal 6
        end
      end

      describe "Fours" do
        let(:game) { subject.score([1,3,4,4,5], :fours) }
        it "must return a score card with fours: 8" do
          game.score_card.fours.must_equal 8
        end
      end

      describe "Fives" do
        let(:game) { subject.score([1,3,4,5,5], :fives) }
        it "must return a score card with fives: 10" do
          game.score_card.fives.must_equal 10
        end
      end

      describe "Sixes" do
        let(:game) { subject.score([1,3,6,5,6], :sixes) }
        it "must return a score card with sixes: 12" do
          game.score_card.sixes.must_equal 12
        end
      end

      describe "Upper Subtotal" do
        let(:game) { subject.score_subtotal({
          aces: 2, twos: 4, threes: 6,
          fours: 8, fives: 10, sixes: 12
        }, :upper_subtotal) }
        it "must return a score card with upper_subtotal: 42" do
          game.score_card.upper_subtotal.must_equal 42
        end
      end
    end

    describe "LowerCard Scoring" do
      describe "full_house" do
        let(:game) { subject.score([1,1,1,2,2], :full_house) }
        it "must return a score card with full_house: 25" do
          game.score_card.full_house.must_equal 25
        end
      end

      describe "small_straight" do
        let(:game) { subject.score([1,2,3,4,6], :small_straight) }
        it "must return a score card with small_straight: 30" do
          game.score_card.small_straight.must_equal 30
        end
      end

      describe "large_straight" do
        let(:game) { subject.score([1,2,3,4,5], :large_straight) }
        it "must return a score card with large_straight: 40" do
          game.score_card.large_straight.must_equal 40
        end
      end

      describe "three_of_a_kind" do
        let(:game) { subject.score([1,2,3,3,3], :three_of_a_kind) }
        it "must return a score card with three_of_a_kind: 9" do
          game.score_card.three_of_a_kind.must_equal 9
        end
      end

      describe "four_of_a_kind" do
        let(:game) { subject.score([1,4,4,4,4], :four_of_a_kind) }
        it "must return a score card with four_of_a_kind: 16" do
          game.score_card.four_of_a_kind.must_equal 16
        end
      end

      describe "yahtzee" do
        let(:game) { subject.score([1,1,1,1,1], :yahtzee) }
        it "must return a score card with yahtzee: 50" do
          game.score_card.yahtzee.must_equal 50
        end
      end

      describe "bonus_yahtzee_1" do
        let(:game) { subject.score([1,1,1,1,1], :bonus_yahtzee_1) }
        it "must return a score card with bonus_yahtzee_1: 100" do
          game.score_card.bonus_yahtzee_1.must_equal 100
        end
      end

      describe "Lower Subtotal" do
        let(:game) { subject.score_subtotal({
          full_house: 25, small_straight: 30, 
          large_straight: 40, three_of_a_kind: 9,
          four_of_a_kind: 12, yahtzee: 50
        }, :lower_subtotal) }
        it "must return a score card with lower_subtotal: 166" do
          game.score_card.lower_subtotal.must_equal 166
        end
      end
    end
  end
end
