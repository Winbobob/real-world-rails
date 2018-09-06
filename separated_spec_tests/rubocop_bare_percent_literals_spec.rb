# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::BarePercentLiterals, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'accepts other delimiters' do
    it 'accepts __FILE__' 


    it 'accepts regular expressions' 


    it 'accepts ""' 


    it 'accepts "" string with interpolation' 


    it "accepts ''" 


    it 'accepts %q' 


    it 'accepts heredoc' 

  end

  context 'when EnforcedStyle is percent_q' do
    let(:cop_config) { { 'EnforcedStyle' => 'percent_q' } }

    context 'and strings are static' do
      it 'registers an offense for %()' 


      it 'auto-corrects' 


      it 'accepts %Q()' 


      include_examples 'accepts other delimiters'
    end

    context 'and strings are dynamic' do
      it 'registers an offense for %()' 


      it 'auto-corrects' 


      it 'accepts %Q()' 


      include_examples 'accepts other delimiters'
    end
  end

  context 'when EnforcedStyle is bare_percent' do
    let(:cop_config) { { 'EnforcedStyle' => 'bare_percent' } }

    context 'and strings are static' do
      it 'registers an offense for %Q()' 


      it 'auto-corrects' 


      it 'accepts %()' 


      include_examples 'accepts other delimiters'
    end

    context 'and strings are dynamic' do
      it 'registers an offense for %Q()' 


      it 'auto-corrects' 


      it 'accepts %()' 


      include_examples 'accepts other delimiters'
    end
  end
end

