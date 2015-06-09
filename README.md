# Functional Yahztee in RUBY

The goal of this project is to build the dice game Yahtzee in a functional, concise, testable manner. The code within is
highly opinionated, and is a hallmark of my style. This is my perfect world where code and beauty collide.

If you are like me, and I know I am... you have something to learn from this code here. This is how you write clean, decoupled, testable, functional ruby code. If you have nothing to learn from this code, please, point something out I have wrong. I love to be *proved* wrong on something so I can correct it.

Expect a series of screencasts discussing the choices I have made here to get the results I ended up with.

[rubyquiz #19](http://rubyquiz.com/quiz19.html) proposed this
problem, and a very imperative solution was provided by James
Edward Gray II, one my ruby heros. I doubt he would write this the same way could he revisit the problem.

This is my contribution to the same problem, with the additional task of being as functional as possible and downright pretty code.

## Ruby is dead

1.8 was the Ruby of your Father. It was for a world with single cores and CPUs growing at a predictable rate each year. Ruby 1.8 is dead....

## Long Live Ruby

Thankfully the teams behind Rubinius, JRuby, and even MRI have been
working on this problem. I am happy to say that Ruby 2.0+ is
perfectly suited as a stepping stone to get you into the new
world, a world where CPU matters not, and cores own.

## Requirements

This is being developed in Ruby 2.1 with CI running on 2.0 and 1.9.3. My style tends to stay away from external dependencies whenever I can. (read: I am not afraid to code what I need)

I haven't gemmified this as of yet, so a clone and bundle with ruby
1.9.3+ and you can run the tests. I would love to get this running on rubinius as well.

```bash
cd <cloned_path>
rake
```

## Usage

```ruby
score_card = ScoreCard.new    
writer     = ScoreCard.persist(score_card)

Round.new do
  roll1 = first_roll             # => [1,2,3,5,5]
  roll2 = second_roll([1,2,3,5]) # => [1,2,3,5,3]
  roll3 = third_roll([1,2,3,5])  # => [1,2,3,5,4]

  score_card = Scoring.score(roll3, :large_straight, &writer)
end

Round.new do
  roll1 = first_roll             # => [1,1,3,5,5]
  roll2 = second_roll([1,1,5,5]) # => [1,1,5,5,1]

  score_card = Scoring.score(roll2, :full_house, &writer)
end

# ...

upper_scores = score_card.upper_scores
score_card = Scoring.score_upper_total(upper_scores, &writer)

game_scores = score_card.lower_scores.merge(
                upper_total: score_card.upper_total)

score_card = Scoring.score_lower_total(game_scores, &writer)

puts "Grand total: #{score_card.game_total}"

```

## Contributions

I am not accepting contributions at this time, this is my showcase code. This is my own highly opinionated software, inspired by all those listed in the section below *Many Thanks*.

