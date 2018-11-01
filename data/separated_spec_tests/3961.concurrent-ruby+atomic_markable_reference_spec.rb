RSpec.describe Concurrent::AtomicMarkableReference do
  subject { described_class.new 1000, true }

  describe '.initialize' do
    it 'constructs the object' 


    it 'has sane defaults' 

  end

  describe '#set' do
    it 'sets the value and mark' 

  end

  describe '#try_update!' do
    it 'updates the value and mark' 


    it 'raises ConcurrentUpdateError when attempting to set inside of block' 

  end

  describe '#try_update' do
    it 'updates the value and mark' 


    it 'returns nil when attempting to set inside of block' 

  end

  describe '#update' do
    it 'updates the value and mark' 


    it 'retries until update succeeds' 

  end

  describe '#compare_and_set' do
    context 'when objects have the same identity' do
      it 'sets the value and mark' 

    end

    context 'when objects have the different identity' do
      it 'it does not set the value or mark' 


      context 'when comparing Numeric objects' do
        context 'Non-idepotent Float' do
          it 'sets the value and mark' 

        end

        context 'BigNum' do
          it 'sets the value and mark' 

        end

        context 'Rational' do
          it 'sets the value and mark' 

        end
      end

      context 'Rational' do
        it 'is successful' 

      end
    end
  end
end

