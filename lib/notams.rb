require "notams/version"
require 'curb'

class String
  def notams
    Notams.notams(self)
  end
end

module Notams
  # Your code goes here
end
