describe QA::Factory::Dependency do
  let(:dependency) { spy('dependency' ) }
  let(:factory) { spy('factory') }
  let(:block) { spy('block') }

  let(:signature) do
    double('signature', factory: dependency, block: block)
  end

  subject do
    described_class.new(:mydep, factory, signature)
  end

  describe '#overridden?' do
    it 'returns true if factory has overridden dependency' 


    it 'returns false if dependency has not been overridden' 

  end

  describe '#build!' do
    context 'when dependency has been overridden' do
      before do
        allow(subject).to receive(:overridden?).and_return(true)
      end

      it 'does not fabricate dependency' 

    end

    context 'when dependency has not been overridden' do
      before do
        allow(subject).to receive(:overridden?).and_return(false)
      end

      it 'fabricates dependency' 


      it 'sets product in the factory' 


      context 'when receives a caller factory as block argument' do
        let(:dependency) { QA::Factory::Base }

        it 'calls given block with dependency factory and caller factory' 

      end
    end
  end
end

