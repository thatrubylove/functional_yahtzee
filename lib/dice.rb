require_relative 'yahtzee'

module Yahtzee::Dice
  DIE_FACES = 6
  MAX_DIE_COUNT = 5
  
  def self.roll(num)
    limit = num > MAX_DIE_COUNT ? MAX_DIE_COUNT : num
    1.upto(limit).map {|die| rand(1..DIE_FACES) }
  end
end


