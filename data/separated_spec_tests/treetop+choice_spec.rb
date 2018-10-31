require 'spec_helper'

module ChoiceSpec
  describe "A choice between terminal symbols" do
    testing_expression '("foo" { def foo_method; end } / "bar" { def bar_method; end } / "baz" { def baz_method; end }) {def bat_method; end}'

    it "successfully parses input matching any of the alternatives, returning a node that responds to methods defined in its respective inline module" 


    it "upon parsing a string matching the second alternative, records the failure of the first terminal" 


    it "upon parsing a string matching the third alternative, records the failure of the first two terminals" 

  end

  describe "A choice between sequences" do
    testing_expression "'foo' 'bar' 'baz'\n/\n'bing' 'bang' 'boom'"

    it "successfully parses input matching any of the alternatives" 

  end

  describe "A choice between terminals followed by a block" do
    testing_expression "('a'/ 'bb' / [c]) { def a_method; end }"

    it "extends a match of any of its subexpressions with a module created from the block" 

  end

  module TestModule
    def a_method
    end
  end

  describe "a choice followed by a declared module" do
    testing_expression "('a'/ 'bb' / [c]) <ChoiceSpec::TestModule>"

    it "extends a match of any of its subexpressions with a module created from the block" 

  end
end

