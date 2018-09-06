require 'spec_helper'

module ParenthesizedExpressionSpec
  describe "An unadorned expression inside of parentheses" do
    testing_expression '("foo")'
  
    it "should behave as normal" 

  end

  describe "A prefixed-expression inside of parentheses" do
    testing_expression '(!"foo")'
  
    it "should behave as normal" 

  end

  describe "An expression with code both inside and outside parentheses" do
    testing_expression '("foo" { def inner; end } ) { def outer; end} '
    it "should extend both code modules " 

  end

end

