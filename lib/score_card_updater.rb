require 'yahtzee'

module Yahtzee
  module ScoreCardUpdater
    module_function

    def update(score_card)
      ->(placement, value) {
          new_card = score_card.clone
          new_card.update!(placement => value)
        }
    end
  end 
end
