# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MultilineMethodSignature, :config do
  subject(:cop) { described_class.new(config) }

  context 'when arguments span multiple lines' do
    context 'when defining an instance method' do
      it 'registers an offense when `end` is on the following line' 


      it 'registers an offense when `end` is on the same line' 

    end

    context 'when arguments span a single line' do
      it 'registers an offense when closing paren is on the following line' 

    end

    context 'when method signature is on a single line' do
      it 'does not register an offense for parameterized method' 


      it 'does not register an offense for unparameterized method' 

    end
  end

  context 'when arguments span multiple lines' do
    context 'when defining an class method' do
      it 'registers an offense when `end` is on the following line' 


      it 'registers an offense when `end` is on the same line' 

    end

    context 'when arguments span a single line' do
      it 'registers an offense when closing paren is on the following line' 

    end

    context 'when method signature is on a single line' do
      it 'does not register an offense for parameterized method' 


      it 'does not register an offense for unparameterized method' 

    end

    context 'when correction would exceed maximum line length' do
      let(:other_cops) do
        {
          'Metrics/LineLength' => { 'Max' => 5 }
        }
      end

      it 'does not register an offense' 

    end

    context 'when correction would not exceed maximum line length' do
      let(:other_cops) do
        {
          'Metrics/LineLength' => { 'Max' => 25 }
        }
      end

      it 'registers an offense' 

    end
  end
end

