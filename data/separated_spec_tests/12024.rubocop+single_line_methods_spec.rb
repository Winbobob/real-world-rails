# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::SingleLineMethods do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Style/SingleLineMethods' => cop_config,
                        'Layout/IndentationWidth' => { 'Width' => 2 })
  end
  let(:cop_config) { { 'AllowIfMethodIsEmpty' => true } }

  it 'registers an offense for a single-line method' 


  context 'when AllowIfMethodIsEmpty is disabled' do
    let(:cop_config) { { 'AllowIfMethodIsEmpty' => false } }

    it 'registers an offense for an empty method' 


    it 'auto-corrects an empty method' 

  end

  context 'when AllowIfMethodIsEmpty is enabled' do
    let(:cop_config) { { 'AllowIfMethodIsEmpty' => true } }

    it 'accepts a single-line empty method' 

  end

  it 'accepts a multi-line method' 


  it 'does not crash on an method with a capitalized name' 


  it 'auto-corrects def with semicolon after method name' 


  it 'auto-corrects defs with parentheses after method name' 


  it 'auto-corrects def with argument in parentheses' 


  it 'auto-corrects def with argument and no parentheses' 


  it 'auto-corrects def with semicolon before end' 

end

