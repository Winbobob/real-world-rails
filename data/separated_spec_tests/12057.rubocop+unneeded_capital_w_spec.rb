# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::UnneededCapitalW do
  subject(:cop) { described_class.new }

  it 'registers no offense for normal arrays of strings' 


  it 'registers no offense for normal arrays of strings with interpolation' 


  it 'registers an offense for misused %W' 


  it 'registers no offense for %W with interpolation' 


  it 'registers no offense for %W with special characters' 


  it 'registers no offense for %w without interpolation' 


  it 'registers no offense for %w with interpolation-like syntax' 


  it 'registers no offense for arrays with character constants' 


  it 'does not register an offense for array of non-words' 


  it 'does not register an offense for array containing non-string' 


  it 'does not register an offense for array with one element' 


  it 'does not register an offense for array with empty strings' 


  it 'auto-corrects an array of words' 


  it 'auto-corrects an array of words with different bracket' 

end

