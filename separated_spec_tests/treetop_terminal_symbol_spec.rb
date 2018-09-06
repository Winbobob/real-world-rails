require 'spec_helper'

module TerminalSymbolSpec
  class Foo < Treetop::Runtime::SyntaxNode
  end

  describe "a terminal symbol followed by a node class declaration and a block" do
    testing_expression "'foo' <TerminalSymbolSpec::Foo> { def a_method; end }"

    it "correctly parses matching input prefixes at various indices, returning an instance of the declared class that can respond to methods defined in the inline module" 


    it "fails to parse nonmatching input at the index even if a match occurs later" 

  end
end

