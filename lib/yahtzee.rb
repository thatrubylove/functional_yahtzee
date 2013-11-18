$:.unshift(File.expand_path("../../lib", __FILE__))

# Yahtzee is the namespace for the whole project
# it is therefore used in every file. Every file
# also need access to our error defs, so that is
# here as well.
#
module Yahtzee
  VERSION = "0.0.2"
end

require 'errors'

