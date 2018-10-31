# -*- coding: utf-8 -*-

require 'word_counter'
require 'spec_helper'

describe WordCounter do
  let(:word_counter) { WordCounter.new("") }

  it "should return zero for an empty string" 


  it "should count plain words delimited with spaces" 


  it "should count plain words delimited with linebreaks" 


  it "should count hyphenated words as one" 


  it "should count contractions as one" 


  it "should not count lone html tags" 


  it "should recognise html tags as word delimiter" 


  it "should not count empty html tags as words" 


  %w(* ~ !? - ~* ~!).each do |char|
    it "should not count a line of #{char} as word" 

  end

  it "should count words with special charcters correctly" 


  %w(— -- , /).each do |char|
    it "should recognise #{char} as word delimiter" 

  end

  %w(— -- - ! ? . , / " ' ).each do |char| #"
    it "should not count lone #{char} as words" 

  end

  it "should handle common punctuation" 


  it "should count words not delimited with space correctly" 


  it "should count words in mixed languages correctly" 

end

