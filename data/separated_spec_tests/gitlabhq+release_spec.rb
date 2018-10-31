describe QA::Runtime::Release do
  context 'when release version has extension strategy' do
    let(:strategy) { spy('strategy') }

    before do
      stub_const('QA::CE::Strategy', strategy)
      stub_const('QA::EE::Strategy', strategy)
    end

    describe '#version' do
      it 'return either CE or EE version' 

    end

    describe '#strategy' do
      it 'return the strategy constant' 

    end

    describe 'delegated class methods' do
      it 'delegates all calls to strategy class' 

    end
  end

  context 'when release version does not have extension strategy' do
    before do
      allow_any_instance_of(described_class)
        .to receive(:version).and_return('something')
    end

    describe '#strategy' do
      it 'raises error' 

    end

    describe 'delegated class methods' do
      it 'raises error' 

    end
  end
end

