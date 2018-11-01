# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceInLambdaLiteral, :config do
  subject(:cop) { described_class.new(config) }

  context 'when configured to enforce spaces' do
    let(:cop_config) { { 'EnforcedStyle' => 'require_space' } }

    it 'registers an offense for no space between -> and (' 


    it 'does not register an offense for a space between -> and (' 


    it 'does not register an offense for multi-line lambdas' 


    it 'does not register an offense for no space between -> and {' 


    it 'registers an offense for no space in the inner nested lambda' 


    it 'registers an offense for no space in the outer nested lambda' 


    it 'registers an offense for no space in both lambdas when nested' 


    it 'autocorrects an offense for no space between -> and (' 


    it 'autocorrects an offense for no space in the inner nested lambda' 


    it 'autocorrects an offense for no space in the outer nested lambda' 


    it 'autocorrects an offense for no space in both lambdas when nested' 

  end

  context 'when configured to enforce no space' do
    let(:cop_config) { { 'EnforcedStyle' => 'require_no_space' } }

    it 'registers an offense for a space between -> and (' 


    it 'does not register an offense for no space between -> and (' 


    it 'does not register an offense for multi-line lambdas' 


    it 'does not register an offense for a space between -> and {' 


    it 'registers an offense for spaces between -> and (' 


    it 'registers an offense for a space in the inner nested lambda' 


    it 'registers an offense for a space in the outer nested lambda' 


    it 'registers two offenses for a space in both lambdas when nested' 


    it 'autocorrects an offense for a space between -> and (' 


    it 'autocorrects an offense for spaces between -> and (' 


    it 'autocorrects an offense for a space in the inner nested lambda' 


    it 'autocorrects an offense for a space in the outer nested lambda' 


    it 'autocorrects two offenses for a space in both lambdas when nested' 

  end
end

