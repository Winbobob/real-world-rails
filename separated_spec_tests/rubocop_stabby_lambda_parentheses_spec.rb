# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::StabbyLambdaParentheses, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'common' do
    it 'does not check the old lambda syntax' 


    it 'does not check a stabby lambda without arguments' 


    it 'does not check a method call named lambda' 

  end

  context 'require_parentheses' do
    let(:cop_config) { { 'EnforcedStyle' => 'require_parentheses' } }

    it_behaves_like 'common'

    it 'registers an offense for a stabby lambda without parentheses' 


    it 'does not register an offense for a stabby lambda with parentheses' 


    it 'autocorrects when a stabby lambda has no parentheses' 

  end

  context 'require_no_parentheses' do
    let(:cop_config) { { 'EnforcedStyle' => 'require_no_parentheses' } }

    it_behaves_like 'common'

    it 'registers an offense for a stabby lambda with parentheses' 


    it 'autocorrects when a stabby lambda does not parentheses' 

  end
end

