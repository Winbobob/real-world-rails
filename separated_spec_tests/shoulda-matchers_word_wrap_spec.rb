require 'spec_helper'
require 'shoulda/matchers/util/word_wrap'

describe Shoulda::Matchers, ".word_wrap" do
  it "can wrap a simple paragraph" 


  it "does not split words up when wrapping" 


  it "considers punctuation as part of a word" 


  it "does not break at the maximum line length, but afterward" 


  it "re-wraps entire paragraphs" 


  it "can wrap multiple paragraphs" 


  it "can wrap a bulleted list" 


  it "re-wraps bulleted lists" 


  it "can wrap a numbered list" 


  it "re-wraps numbered lists" 


  it "can wrap a numbered list, using x) instead of x. as the leader" 


  it "re-wraps numbered lists using x) instead of x. as the leader" 


  it "doesn't mess with indented blocks" 


  context "given a string with a word longer than the max character limit" do
    context "which stands on its own" do
      it "simply returns the string" 

    end

    context "which is preceded by some text" do
      it "leaves the word on its own line" 

    end

    context "which is followed by some text" do
      it "leaves the word on its own line" 

    end
  end

  context "when :indent is given" do
    it "uses the given indentation level when determining where to wrap lines" 

  end
end

