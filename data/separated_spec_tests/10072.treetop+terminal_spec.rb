require 'spec_helper'

module TerminalSymbolSpec
  class Foo < Treetop::Runtime::SyntaxNode
  end

  describe "a terminal symbol" do
    testing_expression "'Foo'"

    it "matches the input string" 


    it "fails to match the input string other than at the start" 


    it "fails to match the input string in the wrong case" 

  end

  describe "a terminal symbol with case-insensitive matching" do
    testing_expression "'Foo'i"

    it "matches the input string in the same case" 


    it "matches the input string in varied case" 

  end

  describe "a terminal symbol followed by a node class declaration and a block" do
    testing_expression "'foo' <TerminalSymbolSpec::Foo> { def a_method; end }"

    it "correctly parses matching input prefixes at various indices, returning an instance of the declared class that can respond to methods defined in the inline module" 


    it "fails to parse nonmatching input at the index even if a match occurs later" 

  end

  module ModFoo
  end

  describe "a terminal symbol followed by a node class declaration and a block" do
    testing_expression "'foo' <TerminalSymbolSpec::ModFoo> { def a_method; end }"

    it "correctly parses matching input prefixes at various indices, returning an instance of SyntaxNode extended with the declared module that can respond to methods defined in the inline module" 

  end

  describe "a terminal regexp" do
    testing_expression "'Fo+'r"

    it "matches the input string" 


    it "fails to match the input string other than at the start" 


    it "fails to match the input string in the wrong case" 

  end

  describe "a case-insensitive terminal regexp" do
    testing_expression "'Fo+'ri"

    it "matches the input string in the same case" 


    it "matches the input string in the same case" 

  end

#  Transient symbols were part of some idea of Nathan's that I no longer recall
#  describe "a transient terminal symbol" do
#    testing_expression "~'foo'"
#
#    it "returns true upon parsing matching input prefixes at various indices" do
#      pending "transient terminal expressions"
#      parse("foo", :index => 0).should be_truthy
#      parse("-foo", :index => 1).should be_truthy
#      parse("---foo", :index => 3).should be_truthy
#    end
#  end
end

