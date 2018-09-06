# encoding: utf-8

require 'spec_helper'

module MultibyteCharsSpec
  describe "an anything symbol", :multibyte => true do
    testing_expression '.'
    it "matches an UTF-8 character" 

  end

  describe "A character class containing UTF-8 characters", :multibyte => true  do
    testing_expression "[æøå]"
    it "recognizes the UTF-8 characters" 

  end

  describe( "a character class repetition containing UTF-8 characters mixed with other expressions",
    :multibyte => true
  ) do
    testing_expression '[æøå]+ "a"'
    it "lazily instantiates a node for the character" 

  end
end

