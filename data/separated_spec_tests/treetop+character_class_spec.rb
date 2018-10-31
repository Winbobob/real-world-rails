require 'spec_helper'

module CharacterClassSpec
  class Foo < Treetop::Runtime::SyntaxNode
  end

  describe "a character class followed by a node class declaration and a block" do

    testing_expression "[A-Z] <CharacterClassSpec::Foo> { def a_method; end }"

    it "matches single characters within that range, returning instances of the declared node class that respond to the method defined in the inline module" 


    it "does not match single characters outside of that range" 


    it "matches a single character within that range at index 1" 


    it "fails to match a single character out of that range at index 1" 

  end

  module ModFoo
  end

  describe "a character class followed by a node module declaration and a block" do

    testing_expression "[A-Z] <CharacterClassSpec::ModFoo> { def a_method; end }"

    it "matches single characters within that range, returning instances of SyntaxNode extended by the specified module" 


    it "does not match single characters outside of that range" 


    it "matches a single character within that range at index 1" 


    it "fails to match a single character out of that range at index 1" 

  end

  describe "a character class with a POSIX bracket expression" do
    testing_expression "[[:digit:]]"
    it "matches a single character within the class" 

    it "does not match a single character outside the class" 

    testing_expression "[[:digit:][:space:]]+"
    it "matches a string with a mix of two character classes" 

  end

  describe "a character class with a negated POSIX bracket expression" do
    testing_expression "[^[:space:]]"
    it "matches a character outside the negated class" 

    it "doesn't match a character within the negated class" 

  end

  describe "a character class followed by a node class declaration and a block" do

    testing_expression "[A-Z] <CharacterClassSpec::Foo>"
    
    it "actively generates nodes for the character when it is the primary node" 

    
  end

  describe "A character class containing quotes" do
    testing_expression "[\"']"

    it "matches a quote" 


    it "matches a double-quote" 

  end

  describe "A character class containing a special character" do
    testing_expression "[\t]"
    it "matches that character only" 

  end

  describe "A character class containing an escaped backslash" do
    slash = "\\"  # Make it explicit that there are *two* backslashes here
    testing_expression "[#{slash}#{slash}]"
    it "matches a backslash only" 

  end

  describe "A character class containing a hex escape" do
    slash = "\\"
    testing_expression "[#{slash}x41]"
    it "matches that character only" 

  end

  describe "A character class containing an octal escape" do
    slash = "\\"
    testing_expression "[#{slash}101]"
    it "matches that character only" 

  end

  describe "A character class containing a \\c control-char escape" do
    slash = "\\"
    testing_expression "[#{slash}cC]"
    it "matches that character only" 

  end

  describe "A character class containing a \\C- control-char escape" do
    slash = "\\"
    testing_expression "[#{slash}C-C]"
    it "matches that character only" 

  end

  if RUBY_VERSION =~ /\A1\.8\./
    describe "A character class containing a \\M- meta-char escape" do
      slash = "\\"
      testing_expression "[#{slash}M- ]"
      it "matches that character only" 

    end
  end

  describe "A character class containing an escaped non-special character" do
    slash = "\\"
    testing_expression "[#{slash}y]"
    it "matches that character only" 

  end

  describe "A character class containing an \#{...} insertion" do
    testing_expression "[\#{raise 'error'}]"
    it "doesn't evaluate the insertion" 

  end
  
  describe "a character class" do
    testing_expression "[A-Z]"
    it "actively generates a node for the character because it is the primary node" 

  end
  
  describe "a character class mixed with other expressions" do
    testing_expression '[A-Z] "a" "bc"'
    it "lazily instantiates a node for the character" 

  end
  
  describe "a character class with a node class declaration mixed with other expressions" do
    testing_expression '([A-Z] <CharacterClassSpec::Foo>) "ab"'
    it "actively generates a node for the character because it has a node class declared" 

  end
  
  describe "a character class with a node module declaration mixed with other expressions" do
    testing_expression '([A-Z] <CharacterClassSpec::ModFoo>) "ab"'
    it "actively generates a node for the character because it has a node module declared" 

  end
  
  describe "a character class with an inline block mixed with other expressions" do
    testing_expression '([A-Z] { def a_method; end }) "ab"'
    it "actively generates a node for the character because it has an inline block" 

  end
  
  describe "a character class with a label mixed with other expressions" do
    testing_expression 'upper:([A-Z]) "b" "cd"'
    it "returns the correct element for the labeled expression" 

  end
  
  describe "a character class repetition mixed with other expressions" do
    testing_expression '[A-Z]+ "a" "bc"'
    it "lazily instantiates a node for the character" 

  end
  
  describe "a character class that gets cached because of a choice" do
    testing_expression "[A-Z] 'a' 'bc' / [A-Z]"
    
    it "generates a node for the lazily-instantiated character when it is the primary node" 

  end

end

