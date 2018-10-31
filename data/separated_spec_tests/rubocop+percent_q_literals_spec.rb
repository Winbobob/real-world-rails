# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::PercentQLiterals, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'accepts quote characters' do
    it 'accepts single quotes' 


    it 'accepts double quotes' 

  end

  shared_examples 'accepts any q string with backslash t' do
    context 'with special characters' do
      it 'accepts %q' 


      it 'accepts %Q' 

    end
  end

  context 'when EnforcedStyle is lower_case_q' do
    let(:cop_config) { { 'EnforcedStyle' => 'lower_case_q' } }

    context 'without interpolation' do
      it 'accepts %q' 


      it 'registers offense for %Q' 


      it 'auto-corrects' 


      include_examples 'accepts quote characters'
      include_examples 'accepts any q string with backslash t'
    end

    context 'with interpolation' do
      it 'accepts %Q' 


      it 'accepts %q' 


      include_examples 'accepts quote characters'
    end
  end

  context 'when EnforcedStyle is upper_case_q' do
    let(:cop_config) { { 'EnforcedStyle' => 'upper_case_q' } }

    context 'without interpolation' do
      it 'registers offense for %q' 


      it 'accepts %Q' 


      it 'auto-corrects' 


      include_examples 'accepts quote characters'
      include_examples 'accepts any q string with backslash t'
    end

    context 'with interpolation' do
      it 'accepts %Q' 


      it 'accepts %q' 


      it 'does not auto-correct' 


      include_examples 'accepts quote characters'
    end
  end
end

