require 'spec_helper'

module SyntaxNodeSpec
  describe "A new terminal syntax node" do
    attr_reader :node

    before do
      @node = Runtime::SyntaxNode.new("input", 0...3)
    end
  
    it "reports itself as terminal" 

  
    it "has a text value based on the input and the interval" 

  
    it "has itself as its only element" 

  end

  describe "A new nonterminal syntax node" do
    attr_reader :node

    before do
      @elements = [Runtime::SyntaxNode.new('input', 0...3)]
      @node = Runtime::SyntaxNode.new('input', 0...3, @elements)
    end

    it "reports itself as nonterminal" 

  
    it "has a text value based on the input and the interval" 

  
    it "has the elements with which it was instantiated" 


    it "sets itself as the parent of its elements" 

  end
  
  describe "A new nonterminal syntax node with all children lazily instantiated" do
    attr_reader :node
    
    it "should lazily instantiate its child nodes" 

    
    it "should lazily replace stand-in child nodes around real ones" 

  end
end

