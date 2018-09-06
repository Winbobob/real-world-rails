# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceInsideHashLiteralBraces, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'EnforcedStyle' => 'space' } }

  context 'with space inside empty braces not allowed' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBraces' => 'no_space' } }

    it 'accepts empty braces with no space inside' 


    it 'registers an offense for empty braces with space inside' 


    it 'auto-corrects unwanted space' 

  end

  context 'with space inside empty braces allowed' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBraces' => 'space' } }

    it 'accepts empty braces with space inside' 


    it 'registers an offense for empty braces with no space inside' 


    it 'auto-corrects missing space' 

  end

  it 'registers an offense for hashes with no spaces if so configured' 


  it 'registers an offense for correct + opposite' 


  it 'auto-corrects missing space' 


  context 'when EnforcedStyle is no_space' do
    let(:cop_config) { { 'EnforcedStyle' => 'no_space' } }

    it 'registers an offense for hashes with spaces' 


    it 'registers an offense for opposite + correct' 


    it 'auto-corrects unwanted space' 


    it 'accepts hashes with no spaces' 


    it 'accepts multiline hash' 


    it 'accepts multiline hash with comment' 

  end

  context 'when EnforcedStyle is compact' do
    let(:cop_config) { { 'EnforcedStyle' => 'compact' } }

    it "doesn't register an offense for non-nested hashes with spaces" 


    it 'registers an offense for nested hashes with spaces' 


    it 'registers an offense for opposite + correct' 


    it 'auto-corrects hashes with no space' 


    it 'auto-corrects nested hashes with spaces' 


    it 'registers offenses for hashes with no spaces' 


    it 'accepts multiline hash' 


    it 'accepts multiline hash with comment' 

  end

  it 'accepts hashes with spaces by default' 


  it 'accepts hash literals with no braces' 


  it 'can handle interpolation in a braceless hash literal' 


  context 'on Hash[{ x: 1 } => [1]]' do
    # regression test; see GH issue 2436
    it 'does not register an offense' 

  end

  context 'on { key: "{" }' do
    # regression test; see GH issue 3958
    it 'does not register an offense' 

  end
end

