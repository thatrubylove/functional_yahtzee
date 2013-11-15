if RUBY_ENGINE == "ruby"
  begin
    require 'coveralls'
    Coveralls.wear!
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
      Coveralls::SimpleCov::Formatter,
      SimpleCov::Formatter::HTMLFormatter
    ]
  rescue LoadError
    warn "unable to load Coveralls!"
  end
end
require 'minitest/autorun'

require_relative '../lib/yahtzee'

