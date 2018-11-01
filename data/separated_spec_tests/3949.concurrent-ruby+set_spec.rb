require 'set'
module Concurrent
  RSpec.describe Set do
    let!(:set) { described_class.new }

    describe '.[]' do
      describe 'when initializing with no arguments' do
        it do
          expect(described_class[]).to be_empty
        end
      end

      describe 'when initializing with arguments' do
        it 'creates a set with the given objects' 

      end
    end

    describe '.new' do
      describe 'when initializing with no arguments' do
        it do
          expect(described_class.new).to be_empty
        end
      end

      describe 'when initializing with an enumerable object' do
        let(:enumerable_object) { [:hello, :world] }

        it 'creates a set with the contents of the enumerable object' 


        describe 'when initializing with a block argument' do
          let(:block_argument) { proc { |value| :"#{value}_ruby" } }

          it 'creates a set with the contents of the enumerable object' 

        end
      end
    end

    context 'concurrency' do
      it do
        (1..Concurrent::ThreadSafe::Test::THREADS).map do |i|
          in_thread do
            1000.times do
              v = i
              set << v
              expect(set).not_to be_empty
              set.delete(v)
            end
          end
        end.map(&:join)
        expect(set).to be_empty
      end
    end
  end
end

