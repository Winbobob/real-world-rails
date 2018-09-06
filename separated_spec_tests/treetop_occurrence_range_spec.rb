require 'spec_helper'

module OccurrenceRangeSpec
  class Foo < Treetop::Runtime::SyntaxNode
  end

  describe "zero to two of a terminal symbol followed by a node class declaration and a block" do
    testing_expression '"foo"..2 <OccurrenceRangeSpec::Foo> { def a_method; end }'

    it "successfully parses epsilon, reporting a failure" 


    it "successfully parses epsilon, returning an instance declared node class and recording a terminal failure" 


    it "successfully parses one of that terminal, returning an instance of the declared node class and recording a terminal failure" 


    it "successfully parses two of that terminal, returning an instance of the declared node class and reporting no failure" 


    it "fails to parses two of that terminal but fails because of an extra one" 


    it "parses two of three of that terminal, reporting no failure" 


  end

  describe "two to four of a terminal symbol followed by a node class declaration and a block" do
    testing_expression '"foo" 2..4 <OccurrenceRangeSpec::Foo> { def a_method; end }'

    it "fails to parse epsilon, reporting a failure" 


    it "fails to parse one of that terminal, returning an instance of the declared node class and recording a terminal failure" 


    it "successfully parses two of that terminal, returning an instance of the declared node class and reporting no failure" 


    it "successfully parses four of that terminal, returning an instance of the declared node class and reporting no failure" 


    it "fails to parses four of that terminal because there's an extra unconsumed one" 

  end

  describe "two to any number of a terminal symbol followed by a node class declaration and a block" do
    testing_expression '"foo" 2.. <OccurrenceRangeSpec::Foo> { def a_method; end }'

    it "fails to parse epsilon, reporting a failure" 


    it "fails to parse one of that terminal, returning an instance of the declared node class and recording a terminal failure" 


    it "successfully parses two of that terminal, returning an instance of the declared node class and reporting no failure" 


    it "successfully parses four of that terminal, returning an instance of the declared node class and reporting a failure on the fifth" 

  end

end

