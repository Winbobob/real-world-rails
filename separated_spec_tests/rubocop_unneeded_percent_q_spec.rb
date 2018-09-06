# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::UnneededPercentQ do
  subject(:cop) { described_class.new }

  context 'with %q strings' do
    it 'registers an offense for only single quotes' 


    it 'registers an offense for only double quotes' 


    it 'registers an offense for no quotes' 


    it 'accepts a string with single quotes and double quotes' 


    it 'registers an offfense for a string containing escaped backslashes' 


    it 'accepts a string with escaped non-backslash characters' 


    it 'accepts a string with escaped backslash and non-backslash characters' 


    it 'accepts regular expressions starting with %q' 


    context 'auto-correct' do
      it 'registers an offense for only single quotes' 


      it 'registers an offense for only double quotes' 


      it 'registers an offense for no quotes' 


      it 'auto-corrects for strings that is concated with backslash' 

    end
  end

  context 'with %Q strings' do
    it 'registers an offense for static string without quotes' 


    it 'registers an offense for static string with only double quotes' 


    it 'registers an offense for dynamic string without quotes' 


    it 'accepts a string with single quotes and double quotes' 


    it 'accepts a string with double quotes and an escaped special character' 


    it 'accepts a string with double quotes and an escaped normal character' 


    it 'accepts a dynamic %Q string with double quotes' 


    it 'accepts regular expressions starting with %Q' 


    context 'auto-correct' do
      it 'corrects a static string without quotes' 


      it 'corrects a static string with only double quotes' 


      it 'corrects a dynamic string without quotes' 


      it 'auto-corrects for strings that is concated with backslash' 

    end
  end

  it 'accepts a heredoc string that contains %q' 


  it 'accepts %q at the beginning of a double quoted string ' \
     'with interpolation' do
    inspect_source("\"%q(a)\#{b}\"")

    expect(cop.messages.empty?).to be(true)
  end

  it 'accepts %Q at the beginning of a double quoted string ' \
     'with interpolation' do
    inspect_source("\"%Q(a)\#{b}\"")

    expect(cop.messages.empty?).to be(true)
  end

  it 'accepts %q at the beginning of a section of a double quoted string ' \
     'with interpolation' do
    inspect_source(%("%\#{b}%q(a)"))

    expect(cop.messages.empty?).to be(true)
  end

  it 'accepts %Q at the beginning of a section of a double quoted string ' \
     'with interpolation' do
    inspect_source(%("%\#{b}%Q(a)"))

    expect(cop.messages.empty?).to be(true)
  end

  it 'accepts %q containing string interpolation' 

end

