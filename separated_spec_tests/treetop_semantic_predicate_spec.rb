require 'spec_helper'

module SemanticPredicateSpec
  describe "An &-predicate block" do
    testing_expression '& {|| $ok_to_succeed}'

    it "succeeds if it returns true, returning an epsilon syntax node" 


    it "fails if it returns false" 


  end

  describe "A sequence of a terminal and an &-predicate block" do
    testing_expression '"prior " &{|s| $value = s[0].text_value; $ok_to_succeed }'

    it "matches the input terminal and consumes it if the block returns true, seeing the terminal in the sequence" 


    it "fails if the block returns false, but sees the terminal in the sequence" 


  end

  describe "A sequence of an optional terminal and an &-predicate block" do
    testing_expression '"prior "? &{|s| $value = s[0].text_value; $ok_to_succeed}'

    it "matches the input terminal and consumes it if the block returns true" 


    it "fails with one terminal_failure if the block returns false" 


    it "fail and return the expected optional preceeding terminal as expected input if the block returns false" 


  end

  describe "A !-predicate block" do
    testing_expression '! {|| $ok_to_succeed}'

    it "succeeds if it returns false, returning an epsilon syntax node" 


    it "fails if it returns true" 


  end

  describe "A sequence of a terminal and an !-predicate block" do
    testing_expression '"prior " !{|s| $value = s[0].text_value; $ok_to_succeed }'

    it "matches the input terminal and consumes it if the block returns false, seeing the terminal in the sequence" 


    it "fails if the block returns true, but sees the terminal in the sequence" 


  end

  describe "A sequence of an optional terminal and an !-predicate block" do
    testing_expression '"prior "? !{|s| $value = s[0].text_value; $ok_to_succeed}'

    it "matches the input terminal and consumes it if the block returns false" 


    it "fails with one terminal_failure if the block returns true" 


    it "fail and return the expected optional preceeding terminal as expected input if the block returns true" 


  end
end

