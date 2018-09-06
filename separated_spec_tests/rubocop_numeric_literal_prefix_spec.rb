# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::NumericLiteralPrefix, :config do
  subject(:cop) { described_class.new(config) }

  context 'octal literals' do
    context 'when config is zero_with_o' do
      let(:cop_config) do
        {
          'EnforcedOctalStyle' => 'zero_with_o'
        }
      end

      it 'registers an offense for prefixes `0` and `0O`' 


      it 'does not register offense for lowercase prefix' 


      it 'autocorrects an octal literal starting with 0' 


      it 'autocorrects an octal literal starting with 0O' 

    end

    context 'when config is zero_only' do
      let(:cop_config) do
        {
          'EnforcedOctalStyle' => 'zero_only'
        }
      end

      it 'registers an offense for prefix `0O` and `0o`' 


      it 'does not register offense for prefix `0`' 


      it 'autocorrects an octal literal starting with 0O or 0o' 


      it 'does not autocorrect an octal literal starting with 0' 

    end
  end

  context 'hex literals' do
    it 'registers an offense for uppercase prefix' 


    it 'does not register offense for lowercase prefix' 


    it 'autocorrects literals with uppercase prefix' 

  end

  context 'binary literals' do
    it 'registers an offense for uppercase prefix' 


    it 'does not register offense for lowercase prefix' 


    it 'autocorrects literals with uppercase prefix' 

  end

  context 'decimal literals' do
    it 'registers an offense for prefixes' 


    it 'does not register offense for no prefix' 


    it 'autocorrects literals with prefix' 


    it 'does not autocorrect literals with no prefix' 

  end
end

