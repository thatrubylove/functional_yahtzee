# Functional Yahztee in RUBY
This is going to serve as my showcase codebase. This is very
indicitive of my style of coding and testing in Ruby. I love
tests, I love idempotentcy, I love pretty code that is short and
concise.

If you are like me, and I know I am... you have something to learn from this code here. This is how you write clean, decoupled, testable, functional ruby code.

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
1.9.3+ and you can run the tests..

```bash
cd <cloned_path>
rake
```

## Usage
Not quite there, I am still working on the functional core to
support the game and the AI.

## Contributions
I am not accepting contributions at this time, this is my showcase code.

## Many Thanks
I would like to say thank you to all the people I have sucked off of like a vampiric zombie since 2007. Some of these were from videos of talks, some were pairing sessions, some were just friends on irc who liked to bang Ruby.

* James Edward Gray II
* Josh Susser
* Ben Curtis
* Avdi Grimm
* Zed
* Gregg Pollack
* Daniel Fischer
* Jose Valim
* Aaron Patterson
* Corey Haines
* Ryan Bates
* Steve Klabnik
* Brian Guthrie
* Fabio Akita
* Rick Olsen
* Obie Fernandez
* Sandi Metz
* Phil Cohen
* Jessica Kerr

Whew.. Sorry if I missed you!

## Health
* My code can beat your code up

[![Build
Status](https://travis-ci.org/dreamr/functional_yahtzee.png)](https://travis-ci.org/dreamr/functional_yahtzee)
[![Coverage Status](https://coveralls.io/repos/dreamr/functional_yahtzee/badge.png?branch=master)](https://coveralls.io/r/dreamr/functional_yahtzee?branch=master) [![CodeClimate Grade](https://codeclimate.com/github/dreamr/functional_yahtzee.png)](https://codeclimate.com/github/dreamr/functional_yahtzee/code)
