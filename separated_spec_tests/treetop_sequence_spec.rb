require 'spec_helper'

module SequenceSpec
  class Foo < Treetop::Runtime::SyntaxNode
  end

  describe "a sequence of labeled terminal symbols followed by a node class declaration and a block" do
    testing_expression 'foo:"foo" bar:"bar" baz:"baz" <SequenceSpec::Foo> { def a_method; end }'

    it "upon successfully matching input, instantiates an instance of the declared node class with element accessor methods and the method from the inline module" 


    it "successfully matches at a non-zero index" 


    it "fails to match non-matching input, recording the parse failure of first non-matching terminal" 

  end

  module ModFoo
  def mod_method; end
  end

  describe "a sequence of labeled terminal symbols followed by a node module declaration and a block" do
    testing_expression 'foo:"foo" bar:"bar" baz:"baz" <SequenceSpec::ModFoo> { def a_method; end }'

    it "upon successfully matching input, instantiates a syntax node and extends it with the declared module, element accessor methods, and the method from the inline module" 

  end

  describe "a labeled single element sequence followed by a node module declaration and a block" do
    testing_expression 'foo:"foo"+ <SequenceSpec::ModFoo> { def a_method; end }'
    it "upon successfully matching input, instantiates a syntax node and extends it with the declared module, element accessor methods, and the method from the inline module" 

  end

  describe "a sequence of non-terminals" do
    testing_grammar %{
      grammar TestGrammar
        rule sequence
          foo bar baz {
            def baz
              'override' + super.text_value
            end
          }
        end

        rule foo 'foo' end
        rule bar 'bar' end
        rule baz 'baz' end
      end
    }

    it "defines accessors for non-terminals automatically that can be overridden in the inline block" 

  end

  describe "Compiling a sequence containing various white-space errors" do
    it "should succeed on a valid sequence" 


    it "rejects space after a label" 


    it "rejects space after label's colon" 


    it "rejects missing space after a primary" 


    it "rejects missing space before node class declaration" 

    
    it "rejects missing space before inline module" 

  end

end

