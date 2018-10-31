# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UnifiedInteger do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  shared_examples 'registers an offense' do |klass|
    context "when #{klass}" do
      context 'without any decorations' do
        let(:source) { "1.is_a?(#{klass})" }

        it 'registers an offense' 


        it 'autocorrects' 

      end

      context 'when explicitly specified as toplevel constant' do
        let(:source) { "1.is_a?(::#{klass})" }

        it 'registers an offense' 


        it 'autocorrects' 

      end

      context 'with MyNamespace' do
        it 'does not register an offense' 

      end
    end
  end

  include_examples 'registers an offense', 'Fixnum'
  include_examples 'registers an offense', 'Bignum'

  context 'when Integer' do
    context 'without any decorations' do
      it 'does not register an offense' 

    end

    context 'when explicitly specified as toplevel constant' do
      it 'does not register an offense' 

    end

    context 'with MyNamespace' do
      it 'does not register an offense' 

    end
  end
end

