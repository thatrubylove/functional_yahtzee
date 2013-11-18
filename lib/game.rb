require 'yahtzee'
require 'dice'
require 'scoring'

# Possibly the imperative shell, I might not end
# up even needing it if I am clever
module Yahtzee
  module Game
    include Yahtzee::Errors
    extend  Yahtzee::Scoring
    extend  Yahtzee::Dice
  end
end
