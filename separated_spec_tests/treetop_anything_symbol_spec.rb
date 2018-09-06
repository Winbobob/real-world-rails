require 'spec_helper'

module AnythingSymbolSpec
  class Foo < Treetop::Runtime::SyntaxNode
  end

  describe "an anything symbol followed by a node class declaration and a block" do
    testing_expression '. <AnythingSymbolSpec::Foo> { def a_method; end }'
  
    it "matches any single character in a big range, returning an instance of the declared node class that responds to methods defined in the inline module" 

  
    it "fails to parse epsilon" 

  end
    
  module ModFoo
  end

  describe "an anything symbol followed by a module declaration and a block" do
    testing_expression '. <AnythingSymbolSpec::ModFoo> { def a_method; end }'
  
    it "matches any single character in a big range, returning an instance of SyntaxNode extended by the declared module that responds to methods defined in the inline module" 

  end
end

