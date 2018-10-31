# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::NotNullColumn, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Include' => nil } }

  context 'with add_column call' do
    context 'with null: false' do
      it 'reports an offense' 

    end

    context 'with null: false and default' do
      it 'does not register an offense' 

    end

    context 'with null: false and default: nil' do
      it 'reports an offense' 

    end

    context 'with null: true' do
      it 'does not register an offense' 

    end

    context 'without any options' do
      it 'does not register an offense' 

    end
  end

  context 'with change_column call' do
    it 'does not register an offense' 

  end

  context 'with create_table call' do
    it 'does not register an offense' 

  end

  context 'with add_reference call' do
    context 'with null: false' do
      it 'reports an offense' 

    end

    context 'with default option' do
      it 'does not register an offense' 

    end

    context 'without any options' do
      it 'does not register an offense' 

    end
  end
end

