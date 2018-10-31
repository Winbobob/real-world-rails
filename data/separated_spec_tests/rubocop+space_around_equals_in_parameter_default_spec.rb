# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceAroundEqualsInParameterDefault, :config do # rubocop:disable Metrics/LineLength
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is space' do
    let(:cop_config) { { 'EnforcedStyle' => 'space' } }

    it 'registers an offense for default value assignment without space' 


    it 'registers an offense for assignment empty string without space' 


    it 'registers an offense for assignment of empty list without space' 


    it 'accepts default value assignment with space' 


    it 'auto-corrects missing space' 


    it 'accepts default value assignment with spaces and unary + operator' 


    it 'auto-corrects missing space for arguments with unary operators' 

  end

  context 'when EnforcedStyle is no_space' do
    let(:cop_config) { { 'EnforcedStyle' => 'no_space' } }

    it 'registers an offense for default value assignment with space' 


    it 'registers an offense for assignment empty string with space' 


    it 'registers an offense for assignment of empty list with space' 


    it 'accepts default value assignment without space' 


    it 'auto-corrects unwanted space' 

  end
end

