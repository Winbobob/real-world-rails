require 'spec_helper'

module AndPredicateSpec
  describe "An &-predicated terminal symbol" do
    testing_expression '&"foo"'

    it "successfully parses input matching the terminal symbol, returning an epsilon syntax node" 

  end

  describe "A sequence of a terminal and an and another &-predicated terminal" do
    testing_expression '"foo" &"bar"'

    it "matches input matching both terminals, but only consumes the first" 

  
    it "fails to parse input matching only the first terminal, with a terminal failure recorded at index 3" 

  end
end

