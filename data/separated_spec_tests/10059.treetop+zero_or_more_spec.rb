require 'spec_helper'

module ZeroOrMoreSpec
  class Foo < Treetop::Runtime::SyntaxNode
  end

  describe "zero or more of a terminal symbol followed by a node class declaration and a block" do
    # testing_expression '("foo" { def b_method; end } )* <ZeroOrMoreSpec::Foo> { def a_method; end }'
    # testing_expression '("foo" { def a_method; end } )* <ZeroOrMoreSpec::Foo>'
    testing_expression '"foo"* <ZeroOrMoreSpec::Foo> { def a_method; end }'

    it "successfully parses epsilon, returning an instance declared node class and recording a terminal failure" 


    it "successfully parses two of that terminal in a row, returning an instance of the declared node class and recording a failure representing the third attempt " 

  end

  describe "Zero or more of a sequence" do
    testing_expression '("foo" "bar")*'

    it "resets the index appropriately following partially matcing input" 

  end

  describe "Zero or more of a choice" do
    testing_expression '("a" / "bb")*'

    it "successfully parses matching input" 

  end
end

