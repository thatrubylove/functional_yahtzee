require_relative 'yahtzee'

module Yahtzee::Dice
  DIE_SIDES = 6
  MAX_DIE_COUNT = 5
  
  def self.roll(num)
    1.upto(num).map {|die| rand(DIE_SIDES) }
  end
end


