require 'yahtzee'
require 'score_card'
require 'persistence/score_card'
require 'scoring/upper_card'
require 'scoring/lower_card'

module Yahtzee
  module Scoring
    require 'game' # needs Yahtzee::Scoring defined first :)

    extend UpperCard
    extend LowerCard   

    module_function    
    def score(dice, placement, &updater)
      value = send("score_#{placement.to_s}", dice)
      updater.call(placement, value)      
    end

    def score_subtotal(scores, placement, &updater)
      value = scores.values.compact.inject(:+)
      updater.call(placement, value)
    end
  end
end

