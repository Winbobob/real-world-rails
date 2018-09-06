# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RaiseArgs, :config do
  subject(:cop) { described_class.new(config) }

  context 'when enforced style is compact' do
    let(:cop_config) { { 'EnforcedStyle' => 'compact' } }

    context 'with a raise with 2 args' do
      it 'reports an offense' 


      it 'auto-corrects to compact style' 

    end

    context 'with correct + opposite' do
      it 'reports an offense' 


      it 'auto-corrects to compact style' 

    end

    context 'with a raise with 3 args' do
      it 'reports an offense' 


      it 'does not auto-correct to compact style' 

    end

    it 'accepts a raise with msg argument' 


    it 'accepts a raise with an exception argument' 

  end

  context 'when enforced style is exploded' do
    let(:cop_config) { { 'EnforcedStyle' => 'exploded' } }

    context 'with a raise with exception object' do
      context 'with one argument' do
        it 'reports an offense' 


        it 'auto-corrects to exploded style' 

      end

      context 'with no arguments' do
        it 'reports an offense' 


        it 'auto-corrects to exploded style' 

      end
    end

    context 'with opposite + correct' do
      it 'reports an offense for opposite + correct' 


      it 'auto-corrects to exploded style' 

    end

    it 'accepts exception constructor with more than 1 argument' 


    it 'accepts exception constructor with keyword arguments' 


    it 'accepts a raise with splatted arguments' 


    it 'accepts a raise with 3 args' 


    it 'accepts a raise with 2 args' 


    it 'accepts a raise with msg argument' 

  end
end

