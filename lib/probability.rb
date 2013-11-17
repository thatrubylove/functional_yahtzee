require 'yahtzee'
require 'dice'

module Yahtzee::Probability
  module_function

  def small_straight(dice, rolls_left)
    possibilities = dice.sort.each_cons(3).select do |a,b,c| 
      a+1==b && b+1==c
    end.flatten
    straight_possibility_from(dice, possibilities, rolls_left)
  end

  def large_straight(dice, rolls_left)
    possibilities = dice.sort.each_cons(4).select do |a,b,c,d| 
      a+1==b && b+1==c && c+1==d
    end.flatten
    straight_possibility_from(dice, possibilities, rolls_left)
  end

private

  def self.straight_possibility_from(dice, possibilities, rolls_left)
    dice_left = (dice-possibilities).count
    possible_faces = dice_left*Yahtzee::Dice::DIE_FACES
    rolls_left.to_f/possible_faces.to_f
  end

end
