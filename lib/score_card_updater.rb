require 'yahtzee'

module Yahtzee
  module ScoreCardUpdater
    module_function

    def update(score_card)
      ->(placement, value) {
        old_values = score_card.to_hash
        new_values = { placement => value }
        score_card = score_card.class.
                                new(old_values.merge(new_values))
      }
    end
  end
end
