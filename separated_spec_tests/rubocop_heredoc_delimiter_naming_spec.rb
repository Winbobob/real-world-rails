# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::HeredocDelimiterNaming, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new(described_class.badge.to_s => cop_config)
  end

  let(:cop_config) do
    { 'Blacklist' => %w[END] }
  end

  context 'with an interpolated heredoc' do
    it 'registers an offense with a non-meaningful delimiter' 


    it 'does not register an offense with a meaningful delimiter' 

  end

  context 'with a non-interpolated heredoc' do
    context 'when using single quoted delimiters' do
      it 'registers an offense with a non-meaningful delimiter' 


      it 'does not register an offense with a meaningful delimiter' 

    end

    context 'when using double quoted delimiters' do
      it 'registers an offense with a non-meaningful delimiter' 


      it 'does not register an offense with a meaningful delimiter' 

    end

    context 'when using back tick delimiters' do
      it 'registers an offense with a non-meaningful delimiter' 


      it 'does not register an offense with a meaningful delimiter' 

    end

    context 'when using non-word delimiters' do
      it 'registers an offense' 

    end
  end

  context 'with a squiggly heredoc', :ruby23 do
    it 'registers an offense with a non-meaningful delimiter' 


    it 'does not register an offense with a meaningful delimiter' 

  end

  context 'with a naked heredoc', :ruby23 do
    it 'registers an offense with a non-meaningful delimiter' 


    it 'does not register an offense with a meaningful delimiter' 

  end

  context 'when the delimiter contains non-letter characters' do
    it 'does not register an offense when delimiter contains an underscore' 


    it 'does not register an offense when delimiter contains a number' 

  end

  context 'with multiple heredocs starting on the same line' do
    it 'registers an offense with a leading non-meaningful delimiter' 


    it 'registers an offense with a trailing non-meaningful delimiter' 


    it 'does not register an offense with meaningful delimiters' 

  end
end

