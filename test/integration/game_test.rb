require 'test_helper'
require 'game'

describe "Starting a new game" do
  subject { Yahtzee::Game.new }

  it "must return a new score card" do
    subject.score_card.wont_be :nil?
  end
end
