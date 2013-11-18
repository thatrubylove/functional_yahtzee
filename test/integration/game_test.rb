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

    # Round 7: Bonus Yahtzee 1
    Round.new do
      Dice.stub :roll, [4,4,4,6,5] do
        first_roll.must_equal [4,4,4,6,5]
      end

      Dice.stub :roll, [4,2] do
        second_roll([4,4,4]).must_equal [4,4,4,4,2]
      end

      Dice.stub :roll, [4,4] do
        third_roll = third_roll([4,4,4])
        third_roll.must_equal [4,4,4,4,4]

        score_card = Scoring.score(third_roll, 
                                   :bonus_yahtzee_1, &writer)

        score_card.bonus_yahtzee_1.must_equal 100
        score_card.four_of_a_kind.must_equal 16
        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end    

    # Round 8: sixes
    Round.new do
      Dice.stub :roll, [6,6,6,6,5] do
        first_roll.must_equal [6,6,6,6,5]
      end

      Dice.stub :roll, [2] do
        second_roll([6,6,6,6]).must_equal [6,6,6,6,2]
      end

      Dice.stub :roll, [4] do
        third_roll = third_roll([6,6,6,6])
        third_roll.must_equal [6,6,6,6,4]

        score_card = Scoring.score(third_roll, 
                                   :sixes, &writer)

        score_card.sixes.must_equal 24
        score_card.bonus_yahtzee_1.must_equal 100
        score_card.four_of_a_kind.must_equal 16
        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 9: threes
    Round.new do
      Dice.stub :roll, [3,3,2,2,1] do
        first_roll.must_equal [3,3,2,2,1]
      end

      Dice.stub :roll, [3,2,2] do
        second_roll([3,3]).must_equal [3,3,3,2,2]
      end

      Dice.stub :roll, [3,1] do
        third_roll = third_roll([3,3,3])
        third_roll.must_equal [3,3,3,3,1]

        score_card = Scoring.score(third_roll, 
                                   :threes, &writer)

        score_card.threes.must_equal 12
        score_card.sixes.must_equal 24
        score_card.bonus_yahtzee_1.must_equal 100
        score_card.four_of_a_kind.must_equal 16
        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 10: large straight
    Round.new do
      Dice.stub :roll, [2,3,4,5,4] do
        first_roll.must_equal [2,3,4,5,4]
      end

      Dice.stub :roll, [3] do
        second_roll([2,3,4,5]).must_equal [2,3,4,5,3]
      end

      Dice.stub :roll, [6] do
        third_roll = third_roll([2,3,4,5])
        third_roll.must_equal [2,3,4,5,6]

        score_card = Scoring.score(third_roll, 
                                   :large_straight, &writer)

        score_card.large_straight.must_equal 40
        score_card.threes.must_equal 12
        score_card.sixes.must_equal 24
        score_card.bonus_yahtzee_1.must_equal 100
        score_card.four_of_a_kind.must_equal 16
        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 11: twos
    Round.new do
      Dice.stub :roll, [2,2,2,5,4] do
        first_roll.must_equal [2,2,2,5,4]
      end

      Dice.stub :roll, [2,1] do
        second_roll([2,2,2]).must_equal [2,2,2,2,1]
      end

      Dice.stub :roll, [4] do
        third_roll = third_roll([2,2,2,2])
        third_roll.must_equal [2,2,2,2,4]

        score_card = Scoring.score(third_roll, 
                                   :twos, &writer)

        score_card.twos.must_equal 8
        score_card.large_straight.must_equal 40
        score_card.threes.must_equal 12
        score_card.sixes.must_equal 24
        score_card.bonus_yahtzee_1.must_equal 100
        score_card.four_of_a_kind.must_equal 16
        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 12: three of a kind
    Round.new do
      Dice.stub :roll, [2,2,2,5,4] do
        first_roll.must_equal [2,2,2,5,4]
      end

      Dice.stub :roll, [1,1] do
        second_roll([2,2,2]).must_equal [2,2,2,1,1]
      end

      Dice.stub :roll, [3,4] do
        third_roll = third_roll([2,2,2])
        third_roll.must_equal [2,2,2,3,4]

        score_card = Scoring.score(third_roll, 
                                   :three_of_a_kind, &writer)

        score_card.three_of_a_kind.must_equal 6
        score_card.twos.must_equal 8
        score_card.large_straight.must_equal 40
        score_card.threes.must_equal 12
        score_card.sixes.must_equal 24
        score_card.bonus_yahtzee_1.must_equal 100
        score_card.four_of_a_kind.must_equal 16
        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 13: fours
    Round.new do
      Dice.stub :roll, [4,4,4,5,4] do
        first_roll.must_equal [4,4,4,5,4]
      end

      Dice.stub :roll, [1] do
        second_roll([4,4,4,4]).must_equal [4,4,4,4,1]
      end

      Dice.stub :roll, [3] do
        third_roll = third_roll([4,4,4,4])
        third_roll.must_equal [4,4,4,4,3]

        score_card = Scoring.score(third_roll, 
                                   :fours, &writer)

        score_card.fours.must_equal 16
        score_card.three_of_a_kind.must_equal 6
        score_card.twos.must_equal 8
        score_card.large_straight.must_equal 40
        score_card.threes.must_equal 12
        score_card.sixes.must_equal 24
        score_card.bonus_yahtzee_1.must_equal 100
        score_card.four_of_a_kind.must_equal 16
        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50
      end
    end

    # Round 14: chance
    Round.new do
      Dice.stub :roll, [4,4,4,5,4] do
        first_roll.must_equal [4,4,4,5,4]
      end

      Dice.stub :roll, [1] do
        second_roll([4,4,4,4]).must_equal [4,4,4,4,1]
      end

      Dice.stub :roll, [3] do
        third_roll = third_roll([4,4,4,4])
        third_roll.must_equal [4,4,4,4,3]

        score_card = Scoring.score(third_roll, 
                                   :chance, &writer)

        score_card.chance.must_equal 19
        score_card.fours.must_equal 16
        score_card.three_of_a_kind.must_equal 6
        score_card.twos.must_equal 8
        score_card.large_straight.must_equal 40
        score_card.threes.must_equal 12
        score_card.sixes.must_equal 24
        score_card.bonus_yahtzee_1.must_equal 100
        score_card.four_of_a_kind.must_equal 16
        score_card.fives.must_equal 20
        score_card.full_house.must_equal 25
        score_card.aces.must_equal 4
        score_card.small_straight.must_equal 30
        score_card.yahtzee.must_equal 50

        assert (score_card.to_hash.
                    select {|_,v| v.nil? }.
                    keys - ScoreCard.meta_keys).
                    none?, "all required fields must be filled"
      end

      # Collect the score from the 'upper' section
      upper_scores = score_card.upper_scores
      # Score and persist upper total
      score_card = Scoring.score_upper_total(upper_scores, 
                                             &writer)
      
      score_card.upper_total.must_equal 119

      # Collect the score from the 'lower' section
      lower_scores = score_card.lower_scores

      # Merge the upper total with the lower scores
      game_scores = lower_scores.merge(
                      upper_total: score_card.upper_total)

      # Score and persist game total
      score_card = Scoring.score_game_total(game_scores, 
                                             &writer)
      
      score_card.game_total.must_equal 405
    end

  end
end

