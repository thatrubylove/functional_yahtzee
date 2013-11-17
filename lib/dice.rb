require_relative 'yahtzee'

# Yahtzee::Dice is just a dice dsl for yahtzee
module Yahtzee::Dice
  DIE_FACES = 6
  MAX_DIE_COUNT = 5
  
  def self.roll(num)
    limit = num > MAX_DIE_COUNT ? MAX_DIE_COUNT : num
    1.upto(limit).map {|die| rand(1..DIE_FACES) }
  end

  def self.reroll(keepers)
    new_roll = keepers + roll(MAX_DIE_COUNT-keepers.count)
    new_roll[0..(MAX_DIE_COUNT-1)]
  end
end


