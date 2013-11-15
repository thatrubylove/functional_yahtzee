# Functional Yahztee in RUBY
This is a stab at the [rubyquiz #19](http://rubyquiz.com/quiz19.html) problem and solution. I find the solution offered to be a highly coupled ugly mess of shit. And yes, I think I can do better, or I wouldn't be writing a yahtzee game.

## Usage
No idea yet. I want it decoupled from any UI. It should be able to be plugged into a web or console UI easily. I don't 'do' top down.

I like getting the functional internals squared away first. I can identify internals pretty easily based on many, many years of writing shit.

As I build my internals (functional and idempotent) I move closer to my domain and the dsl starts to present itself.

In OO I go top down, in functional I go bottom up.

Writing short, functional, idempotent (READ AWESOME) methods to lead the design is better than letting the 'real' world lead the design. This is my experience anyway - your milage may vary. 

Controversial, eat me. My code can beat your code up..

## Health
* Because application health is important, just ask
  [healtcare.gov](http://www.healthcare.gov).

[![Build
Status](https://travis-ci.org/dreamr/functional_yahtzee.png)](https://travis-ci.org/dreamr/functional_yahtzee)
[![Coverage Status](https://coveralls.io/repos/dreamr/functional_yahtzee/badge.png?branch=master)](https://coveralls.io/r/dreamr/functional_yahtzee?branch=master) [![CodeClimate Grade](https://codeclimate.com/github/dreamr/functional_yahtzee.png)](https://codeclimate.com/github/dreamr/functional_yahtzee/code)
