# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::NumericLiterals, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'MinDigits' => 5 } }

  it 'registers an offense for a long undelimited integer' 


  it 'registers an offense for a float with a long undelimited integer part' 


  it 'accepts integers with less than three places at the end' 


  it 'registers an offense for an integer with misplaced underscore' 


  it 'accepts long numbers with underscore' 


  it 'accepts a short integer without underscore' 


  it 'does not count a leading minus sign as a digit' 


  it 'accepts short numbers without underscore' 


  it 'ignores non-decimal literals' 


  it 'autocorrects a long integer offense' 


  it 'autocorrects an integer with misplaced underscore' 


  it 'autocorrects negative numbers' 


  it 'autocorrects floating-point numbers' 


  it 'autocorrects negative floating-point numbers' 


  context 'strict' do
    let(:cop_config) do
      {
        'MinDigits' => 5,
        'Strict' => true
      }
    end

    it 'registers an offense for an integer with misplaced underscore' 

  end
end

