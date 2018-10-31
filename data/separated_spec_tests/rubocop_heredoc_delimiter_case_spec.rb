# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::HeredocDelimiterCase, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new(described_class.badge.to_s => cop_config)
  end

  context 'when enforced style is uppercase' do
    let(:cop_config) do
      {
        'SupportedStyles' => %w[uppercase lowercase],
        'EnforcedStyle' => 'uppercase'
      }
    end

    context 'with an interpolated heredoc' do
      it 'registers an offense with a lowercase delimiter' 


      it 'registers an offense with a camel case delimiter' 


      it 'does not register an offense with an uppercase delimiter' 

    end

    context 'with a non-interpolated heredoc' do
      context 'when using single quoted delimiters' do
        it 'registers an offense with a lowercase delimiter' 


        it 'registers an offense with a camel case delimiter' 


        it 'does not register an offense with an uppercase delimiter' 

      end

      context 'when using double quoted delimiters' do
        it 'registers an offense with a lowercase delimiter' 


        it 'registers an offense with a camel case delimiter' 


        it 'does not register an offense with an uppercase delimiter' 

      end

      context 'when using back tick delimiters' do
        it 'registers an offense with a lowercase delimiter' 


        it 'registers an offense with a camel case delimiter' 


        it 'does not register an offense with an uppercase delimiter' 

      end

      context 'when using non-word delimiters' do
        it 'does not register an offense' 

      end
    end

    context 'with a squiggly heredoc', :ruby23 do
      it 'registers an offense with a lowercase delimiter' 


      it 'registers an offense with a camel case delimiter' 


      it 'does not register an offense with an uppercase delimiter' 

    end
  end

  context 'when enforced style is lowercase' do
    let(:cop_config) do
      {
        'SupportedStyles' => %w[uppercase lowercase],
        'EnforcedStyle' => 'lowercase'
      }
    end

    context 'with an interpolated heredoc' do
      it 'does not register an offense with a lowercase delimiter' 


      it 'registers an offense with a camel case delimiter' 


      it 'registers an offense with an uppercase delimiter' 

    end

    context 'with a non-interpolated heredoc' do
      it 'does not reguster an offense with a lowercase delimiter' 


      it 'registers an offense with a camel case delimiter' 


      it 'registers an offense with an uppercase delimiter' 

    end

    context 'with a squiggly heredoc', :ruby23 do
      it 'does not register an offense with a lowercase delimiter' 


      it 'registers an offense with a camel case delimiter' 


      it 'registers an offense with an uppercase delimiter' 

    end
  end
end

