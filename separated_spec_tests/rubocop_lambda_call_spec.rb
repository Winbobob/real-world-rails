# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::LambdaCall, :config do
  subject(:cop) { described_class.new(config) }

  context 'when style is set to call' do
    let(:cop_config) { { 'EnforcedStyle' => 'call' } }

    it 'registers an offense for x.()' 


    it 'registers an offense for correct + opposite' 


    it 'accepts x.call()' 


    it 'auto-corrects x.() to x.call()' 

  end

  context 'when style is set to braces' do
    let(:cop_config) { { 'EnforcedStyle' => 'braces' } }

    it 'registers an offense for x.call()' 


    it 'registers an offense for opposite + correct' 


    it 'accepts x.()' 


    it 'accepts a call without receiver' 


    it 'auto-corrects x.call() to x.()' 


    it 'auto-corrects x.call to x.()' 


    it 'auto-corrects x.call asdf, x123 to x.(asdf, x123)' 

  end
end

