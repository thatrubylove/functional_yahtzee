require 'test_helper'
require 'game'
include Yahtzee
include Yahtzee::Game

describe Yahtzee::Game do
  it "must play a full 1 person game" do
    # Inore Dice stubs. They are only here to 'cheat'
    # the outcomewhile testing the 'dsl'

    score_card = ScoreCard.new    
    writer     = ScoreCard.persist(score_card)

    # Round 1: Yahtzee
    Round.new do
      Dice.stub :roll, [2,2,4,6,6] do
        first_roll.must_equal [2,2,4,6,6]
      end

      Dice.stub :roll, [2,2,6] do
        second_roll([2,2]).must_equal [2,2,2,2,6]
      end

      Dice.stub :roll, [2] do
        third_roll = third_roll([2,2,2,2])
        third_roll.must_equal [2,2,2,2,2]

        score_card = Scoring.score(third_roll, 
                                   :yahtzee, &writer)

        score_card.yahtzee.must_equal 50
      end
    end

    # Round 2: Small Straight
    Round.new do
      Dice.stub :roll, [1,2,3,6,6] do
        first_roll.must_equal [1,2,3,6,6]
      end

      Dice.stub :roll, [4,4,4] do
        second_roll([1,2,3]).must_equal [1,2,3,4,4]
      end

      Dice.stub :roll, [2] do
        third_roll = third_roll([1,2,3,4])
        third_roll.must_equal [1,2,3,4,2]

        score_card = Scoring.score(third_roll, 
                                   :small_straight, &writer)

        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 3: Aces
    Round.new do
      Dice.stub :roll, [1,1,1,3,6] do
        first_roll.must_equal [1,1,1,3,6]
      end

      Dice.stub :roll, [1,4] do
        second_roll([1,1,1]).must_equal [1,1,1,1,4]
      end

      Dice.stub :roll, [2] do
        third_roll = third_roll([1,1,1,1])
        third_roll.must_equal [1,1,1,1,2]

        score_card = Scoring.score(third_roll, 
                                   :aces, &writer)

        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 4: Full House
    Round.new do
      Dice.stub :roll, [1,1,2,3,6] do
        first_roll.must_equal [1,1,2,3,6]
      end

      Dice.stub :roll, [1,4,5] do
        second_roll([1,1]).must_equal [1,1,1,4,5]
      end

      Dice.stub :roll, [4,4] do
        third_roll = third_roll([1,1,1])
        third_roll.must_equal [1,1,1,4,4]

        score_card = Scoring.score(third_roll, 
                                   :full_house, &writer)

        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 5: Fives
    Round.new do
      Dice.stub :roll, [1,5,2,5,5] do
        first_roll.must_equal [1,5,2,5,5]
      end

      Dice.stub :roll, [4,5] do
        second_roll([5,5,5]).must_equal [5,5,5,4,5]
      end

      Dice.stub :roll, [4] do
        third_roll = third_roll([5,5,5,5])
        third_roll.must_equal [5,5,5,5,4]

        score_card = Scoring.score(third_roll, 
                                   :fives, &writer)

        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 6: Four of a Kind
    Round.new do
      Dice.stub :roll, [4,4,4,5,5] do
        first_roll.must_equal [4,4,4,5,5]
      end

      Dice.stub :roll, [4,5] do
        second_roll([4,4,4]).must_equal [4,4,4,4,5]
      end

      Dice.stub :roll, [4,3] do
        third_roll = third_roll([4,4,4])
        third_roll.must_equal [4,4,4,4,3]

        score_card = Scoring.score(third_roll, 
                                   :four_of_a_kind, &writer)

        score_card.four_of_a_kind.must_equal 16
        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end    

  end
end

