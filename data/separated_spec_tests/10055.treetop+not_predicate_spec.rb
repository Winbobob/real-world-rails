require 'spec_helper'

module NotPredicateSpec
  describe "A !-predicated terminal symbol" do
    testing_expression '!"foo"'

    it "fails to parse input matching the terminal symbol" 

  end

  describe "A !-predicated character class symbol" do
    testing_expression '![aeiou]'

    it "fails to parse input matching the terminal symbol" 

  end

  describe "A sequence of a terminal and an and another !-predicated terminal" do
    testing_expression '"foo" !"bar"'

    it "fails to match input matching both terminals" 

  
    it "successfully parses input matching the first terminal and not the second, reporting the parse failure of the second terminal" 

  end

  describe "A !-predicated sequence" do
    testing_expression '!("a" "b" "cc")'

    it "fails to parse matching input" 

  end
end

