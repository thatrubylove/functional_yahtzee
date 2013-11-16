require 'yahtzee'

module Yahtzee
  module ScoreCardUpdater
    module_function

    def update(game_card)
      ->(placement, value) {
          game_card.update!(placement => value)
        }
    end
  end 
end
