# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::ActionFilter, :config do
  describe '::FILTER_METHODS' do
    it 'contains all of the filter methods' 

  end

  describe '::ACTION_METHODS' do
    it 'contains all of the action methods' 

  end

  context 'Rails <= 4.0', :rails3 do
    subject(:cop) { described_class.new(config) }

    let(:cop_config) { { 'Include' => nil } }

    context 'when using action methods' do
      described_class::FILTER_METHODS.each do |method|
        it "does not register an offense for #{method}" 


        it "does not register an offense for #{method} with block" 

      end

      described_class::ACTION_METHODS.each do |method|
        it "accepts #{method}" 

      end

      it 'does not auto-correct to preferred method' 

    end

    context 'when using filter methods' do
      described_class::ACTION_METHODS.each do |method|
        it "does not register an offense for #{method}" 


        it "does not register an offense for #{method} with block" 

      end

      described_class::FILTER_METHODS.each do |method|
        it "accepts #{method}" 

      end

      it 'does not auto-correct to preferred method' 

    end
  end

  context 'Rails >= 4.0', :rails4 do
    subject(:cop) { described_class.new(config) }

    let(:cop_config) { { 'Include' => nil } }

    context 'when style is action' do
      before do
        cop_config['EnforcedStyle'] = 'action'
      end

      described_class::FILTER_METHODS.each do |method|
        it "registers an offense for #{method}" 


        it "registers an offense for #{method} with block" 

      end

      described_class::ACTION_METHODS.each do |method|
        it "accepts #{method}" 

      end

      it 'auto-corrects to preferred method' 

    end

    context 'when style is filter' do
      before do
        cop_config['EnforcedStyle'] = 'filter'
      end

      described_class::ACTION_METHODS.each do |method|
        it "registers an offense for #{method}" 


        it "registers an offense for #{method} with block" 

      end

      described_class::FILTER_METHODS.each do |method|
        it "accepts #{method}" 

      end

      it 'auto-corrects to preferred method' 

    end
  end
end

