# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::SymbolArray, :config do
  subject(:cop) { described_class.new(config) }

  before do
    # Reset data which is shared by all instances of SymbolArray
    described_class.largest_brackets = -Float::INFINITY
  end

  let(:other_cops) do
    {
      'Style/PercentLiteralDelimiters' => {
        'PreferredDelimiters' => {
          'default' => '()'
        }
      }
    }
  end

  context 'when EnforcedStyle is percent' do
    let(:cop_config) do
      { 'MinSize' => 0,
        'EnforcedStyle' => 'percent' }
    end

    it 'registers an offense for arrays of symbols' 


    it 'autocorrects arrays of symbols' 


    it 'autocorrects arrays of one symbol' 


    it 'autocorrects arrays of symbols with new line' 


    it 'uses %I when appropriate' 


    it "doesn't break when a symbol contains )" 


    it 'does not register an offense for array with non-syms' 


    it 'does not register an offense for array starting with %i' 


    it 'does not register an offense if symbol contains whitespace' 


    # Bug: https://github.com/rubocop-hq/rubocop/issues/4481
    it 'does not register an offense in an ambiguous block context' 


    it 'registers an offense in a non-ambiguous block context' 


    it 'detects right value for MinSize to use for --auto-gen-config' 


    it 'detects when the cop must be disabled to avoid offenses' 


    context 'when PreferredDelimiters is specified' do
      let(:other_cops) do
        {
          'Style/PercentLiteralDelimiters' => {
            'PreferredDelimiters' => {
              'default' => '[]'
            }
          }
        }
      end

      it 'autocorrects an array with delimiters' 


      it 'autocorrects an array in multiple lines' 


      it 'autocorrects an array using partial newlines' 

    end
  end

  context 'when EnforcedStyle is array' do
    let(:cop_config) { { 'EnforcedStyle' => 'brackets', 'MinSize' => 0 } }

    it 'does not register an offense for arrays of symbols' 


    it 'registers an offense for array starting with %i' 


    it 'autocorrects an array starting with %i' 

  end

  context 'with non-default MinSize' do
    let(:cop_config) do
      { 'MinSize' => 2,
        'EnforcedStyle' => 'percent' }
    end

    it 'does not autocorrects array of one symbol if MinSize > 1' 

  end
end

