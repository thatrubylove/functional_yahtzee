require 'test_helper'
require 'scoring'

describe Yahtzee::Scoring do
  subject { Yahtzee::Scoring }

  describe "score(dice, placement)" do
    let(:score_card) { Yahtzee::ScoreCard.new }
    let(:save_card)  { Yahtzee::ScoreCard.save(score_card) }

    describe "score_game_total(scores, &save_card)" do
      let(:scores) {{
        upper_total: 119, lower_subtotal: 166
      }}

      it "must return a score card with the game total of 285 (119+166)" do
        subject.score_game_total(scores, &save_card).
                game_total.must_equal 285
      end
    end
    
    describe "UpperCard Scoring" do
      describe "Aces" do
        it "must return a score card with aces: 2" do
          subject.score([1,1,3,4,5], :aces, &save_card).
                  aces.must_equal 2
        end
      end

      describe "Twos" do
        it "must return a score card with twos: 4" do
          subject.score([1,2,2,4,5], :twos, &save_card).
                  twos.must_equal 4
        end
      end

      describe "Threes" do
        it "must return a score card with threes: 6" do
          subject.score([1,3,3,4,5], :threes, &save_card).
                  threes.must_equal 6
        end
      end

      describe "Fours" do
        it "must return a score card with fours: 8" do
          subject.score([1,3,4,4,5], :fours, &save_card).
                  fours.must_equal 8
        end
      end

      describe "Fives" do
        it "must return a score card with fives: 10" do
          subject.score([1,3,4,5,5], :fives, &save_card).
                  fives.must_equal 10
        end
      end

      describe "Sixes" do
        it "must return a score card with sixes: 12" do
          subject.score([1,3,6,5,6], :sixes, &save_card).
                  sixes.must_equal 12
        end
      end

      describe "Upper Subtotal" do
        let(:scores) {{
          aces: 2, twos: 4, threes: 6,
          fours: 8, fives: 10, sixes: 12
        }}

        it "must return a score card with upper_subtotal: 42" do
          subject.score_subtotal(scores, :upper_subtotal, &save_card).
                  upper_subtotal.must_equal 42
        end
      end

      describe "score_upper_total(scores, &save_card)" do
        let(:scores) {{
          aces: 4, twos: 8, threes: 12,
          fours: 16, fives: 20, sixes: 24
        }}

        it "must a score card with an upper_total of 119 (84+35)" do
          subject.score_upper_total(scores, &save_card).
                  upper_total.must_equal 119
        end
      end
      describe "when the sum is not over 63" do
        let(:scores) {{
          aces: 2, twos: 4, threes: 6,
          fours: 8, fives: 10, sixes: 12
        }}
        it "must return a score card with an upper_total of 42" do
          subject.score_upper_total(scores, &save_card).
                  upper_total.must_equal 42
        end
      end
    end

    describe "LowerCard Scoring" do
      describe "chance" do
        it "must sum the dice" do
          subject.score([1,2,3,4,5], :chance, &save_card).
                  chance.must_equal 15
        end
      end

      describe "full_house" do
        it "must return a score card with full_house: 25" do
          subject.score([1,1,1,2,2], :full_house, &save_card).
                  full_house.must_equal 25
        end
      end

      describe "small_straight" do
        it "must return a score card with small_straight: 30" do
          subject.score([1,2,3,4,6], :small_straight, &save_card).
                  small_straight.must_equal 30
        end
      end

      describe "large_straight" do
        it "must return a score card with large_straight: 40" do
          subject.score([1,2,3,4,5], :large_straight, &save_card).
                  large_straight.must_equal 40
        end
      end

      describe "three_of_a_kind" do
        it "must return a score card with three_of_a_kind: 9" do
          subject.score([1,2,3,3,3], :three_of_a_kind, &save_card).
                  three_of_a_kind.must_equal 9
        end
      end

      describe "four_of_a_kind" do
        it "must return a score card with four_of_a_kind: 16" do
          subject.score([1,4,4,4,4], :four_of_a_kind, &save_card).
                  four_of_a_kind.must_equal 16
        end
      end

      describe "yahtzee" do
        it "must return a score card with yahtzee: 50" do
          subject.score([1,1,1,1,1], :yahtzee, &save_card).yahtzee.must_equal 50
        end
      end

      describe "bonus_yahtzee_1" do
        it "must return a score card with bonus_yahtzee_1: 100" do
          subject.score([1,1,1,1,1], :bonus_yahtzee_1, &save_card).
                  bonus_yahtzee_1.must_equal 100
        end
      end

      describe "Lower Subtotal" do
        let(:scores) {{
          full_house: 25, small_straight: 30, 
          large_straight: 40, three_of_a_kind: 9,
          four_of_a_kind: 12, yahtzee: 50
        }}
        it "must return a score card with lower_subtotal: 166" do
          subject.score_subtotal(scores, :lower_subtotal, &save_card).
                  lower_subtotal.must_equal 166
        end
      end
    end
  end
end
