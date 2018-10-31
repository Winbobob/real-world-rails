module Concurrent
  RSpec.describe Hash do
    let!(:hsh) { described_class.new }

    describe '.[]' do
      describe 'when initializing with no arguments' do
        it do
          expect(described_class[]).to be_empty
        end
      end

      describe 'when initializing with an even number of arguments' do
        it 'creates a hash using the odd position arguments as keys and even position arguments as values' 

      end

      describe 'when initializing with an array of pairs' do
        let(:array_of_pairs) { [[:hello, 'hello'], [:world, 'world']] }

        it 'creates a hash using each pair as a (key, value) pair' 

      end

      describe 'when initializing with another hash as an argument' do
        let(:other_hash) { {hello: 'hello', world: 'world'} }
        let(:fake_other_hash) { double('Fake hash', to_hash: other_hash) }

        it 'creates a new hash' 


        it 'creates a hash with the same contents as the other hash' 


        it 'creates a hash with the results of calling #to_hash on the other array' 

      end
    end

    describe '.new' do
      describe 'when initializing with no arguments' do
        it do
          expect(described_class.new).to be_empty
        end
      end

      describe 'when initialized with a default object' do
        let(:default_object) { :ruby }

        it 'uses the default object for non-existing keys' 

      end

      describe 'when initialized with a block' do
        it 'calls the block for non-existing keys' 


        it 'returns the results of calling the block for non-existing key' 

      end
    end

    context 'concurrency' do
      it do
        (1..Concurrent::ThreadSafe::Test::THREADS).map do |i|
          in_thread do
            1000.times do |j|
              hsh[i * 1000 + j] = i
              expect(hsh[i * 1000 + j]).to eq(i)
              expect(hsh.delete(i * 1000 + j)).to eq(i)
            end
          end
        end.map(&:join)
        expect(hsh).to be_empty
      end
    end
  end
end

