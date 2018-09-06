require_relative 'helper'

describe Pry do
  before do
    @str_output = StringIO.new
  end

  [
    ["p = '", "'"],
    ["def", "a", "(); end"],
    ["p = <<FOO", "lots", "and", "lots of", "foo", "FOO"],
    ["[", ":lets,", "'list',", "[/nested/", "], things ]"],
    ["abc =~ /hello", "/"],
    ["issue = %W/", "343/"],
    ["pouts(<<HI, 'foo", "bar", "HI", "baz')"],
  ].each do |foo|
    it "should not raise an error on broken lines: #{foo.join("\\n")}" 

  end

  ([
    ["end"],
    ["puts )("],
    ["1 1"],
    ["puts :"]
  ] + (Pry::Helpers::BaseHelpers.rbx? ? [] : [
    ["def", "method(1"], # in this case the syntax error is "expecting ')'".
    ["o = Object.new.tap{ def o.render;","'MEH'", "}"] # in this case the syntax error is "expecting keyword_end".
  ])).compact.each do |foo|
    it "should raise an error on invalid syntax like #{foo.inspect}" 

  end

  it "should not intefere with syntax errors explicitly raised" 


  it "should allow trailing , to continue the line" 


  it "should complete an expression that contains a line ending with a ," 


  it "should not suppress the error output if the line ends in ;" 


  it "should not clobber _ex_ on a SyntaxError in the repl" 


  it "should allow whitespace delimeted strings" 


  it "should allow newline delimeted strings" 


  it "should allow whitespace delimeted strings ending on the first char of a line" 

end

