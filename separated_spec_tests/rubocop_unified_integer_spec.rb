# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UnifiedInteger do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  shared_examples 'registers an offence' do |klass|
    context "when #{klass}" do
      context 'without any decorations' do
        let(:source) { "1.is_a?(#{klass})" }

        it 'registers an offence' 


        it 'autocorrects' 

      end

      context 'when explicitly specified as toplevel constant' do
        let(:source) { "1.is_a?(::#{klass})" }

        it 'registers an offence' 


        it 'autocorrects' 

      end

      context 'with MyNamespace' do
        let(:source) { "1.is_a?(MyNamespace::#{klass})" }

        include_examples 'accepts'
      end
    end
  end

  include_examples 'registers an offence', 'Fixnum'
  include_examples 'registers an offence', 'Bignum'

  context 'when Integer' do
    context 'without any decorations' do
      let(:source) { '1.is_a?(Integer)' }

      include_examples 'accepts'
    end

    context 'when explicitly specified as toplevel constant' do
      let(:source) { '1.is_a?(::Integer)' }

      include_examples 'accepts'
    end

    context 'with MyNamespace' do
      let(:source) { '1.is_a?(MyNamespace::Integer)' }

      include_examples 'accepts'
    end
  end
end

