# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::HttpStatus, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is `symbolic`' do
    let(:cop_config) { { 'EnforcedStyle' => 'symbolic' } }

    it 'registers an offense when using numeric value' 


    it 'does not register an offense when using symbolic value' 


    it 'does not register an offense when using custom HTTP code' 


    context 'when rack is not loaded' do
      before { stub_const("#{described_class}::RACK_LOADED", false) }

      it 'registers an offense when using numeric value' 

    end

    describe 'autocorrect' do
      context 'when render action' do
        it 'autocorrects to symbolic style' 

      end

      context 'when render json' do
        it 'autocorrects to symbolic style' 

      end

      context 'when render plain' do
        it 'autocorrects to symbolic style' 

      end

      context 'when redirect_to' do
        it 'autocorrects to symbolic style' 

      end
    end
  end

  context 'when EnforcedStyle is `numeric`' do
    let(:cop_config) { { 'EnforcedStyle' => 'numeric' } }

    it 'registers an offense when using symbolic value' 


    it 'does not register an offense when using numeric value' 


    it 'does not register an offense when using whitelisted symbols' 


    context 'when rack is not loaded' do
      before { stub_const("#{described_class}::RACK_LOADED", false) }

      it 'registers an offense when using symbolic value' 

    end

    describe 'autocorrect' do
      context 'when render action' do
        it 'autocorrects to symbolic style' 

      end

      context 'when render json' do
        it 'autocorrects to symbolic style' 

      end

      context 'when render plain' do
        it 'autocorrects to symbolic style' 

      end

      context 'when redirect_to' do
        it 'autocorrects to symbolic style' 

      end
    end
  end
end

