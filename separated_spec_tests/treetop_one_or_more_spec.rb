require 'spec_helper'

module OneOrMoreSpec
  class Foo < Treetop::Runtime::SyntaxNode
  end

  describe "one or more of a terminal symbol followed by a node class declaration and a block" do
    testing_expression '"foo"+ <OneOrMoreSpec::Foo> { def a_method; end }'

    it "fails to parse epsilon, reporting a failure" 

  
    it "successfully parses two of that terminal in a row, returning an instance of the declared node class and reporting the failure the third parsing attempt" 

  end
end

