require 'test_helper'
require 'scoring'

describe Yahtzee::Scoring::Card do
    subject { Yahtzee::Scoring::Card.new }

    describe "place_key(place)" do
      it "must return upper for uppers" do
        subject.upper_scores.each do |us|
          subject.place_key(us).must_equal "upper[#{us}]"
        end
      end

      it "must return lower for lowers" do
        subject.lower_scores.each do |us|
          subject.place_key(us).must_equal "lower[#{us}]"
        end
      end
    end
  end

