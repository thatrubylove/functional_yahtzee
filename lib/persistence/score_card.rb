require 'yahtzee'
require 'score_card'

module Yahtzee::Persistence
  module ScoreCard
    module_function

    def update(game_card)
      ->(placement, value) {
          game_card.update!(placement => value)
        }
    end
  end 
end
