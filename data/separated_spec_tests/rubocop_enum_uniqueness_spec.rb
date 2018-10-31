# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::EnumUniqueness, :config do
  subject(:cop) { described_class.new }

  context 'when array syntax is used' do
    context 'with a single duplicated enum value' do
      it 'registers an offense' 

    end

    context 'with several duplicated enum values' do
      it 'registers two offenses' 

    end

    context 'with no duplicated enum values' do
      it 'does not register an offense for unique enum values' 

    end
  end

  context 'when hash syntax is used' do
    context 'with a single duplicated enum value' do
      it 'registers an offense' 

    end

    context 'with several duplicated enum values' do
      it 'registers two offenses' 

    end

    context 'with no duplicated enum values' do
      it 'does not register an offense' 

    end
  end

  context 'when receiving a variable' do
    it 'does not register an offense' 

  end

  context 'when receiving a hash without literal values' do
    context 'when value is a variable' do
      it 'does not register an offense' 

    end

    context 'when value is a method chain' do
      it 'does not register an offense' 

    end

    context 'when value is a constant' do
      it 'does not register an offense' 

    end
  end
end

