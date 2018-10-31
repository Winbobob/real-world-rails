module Concurrent
  RSpec.describe Array do
    let!(:ary) { described_class.new }

    describe '.[]' do
      describe 'when initializing with no arguments' do
        it do
          expect(described_class[]).to be_empty
        end
      end

      describe 'when initializing with arguments' do
        it 'creates an array with the given objects' 

      end
    end

    describe '.new' do
      describe 'when initializing with no arguments' do
        it do
          expect(described_class.new).to be_empty
        end
      end

      describe 'when initializing with a size argument' do
        let(:size) { 3 }

        it 'creates an array with size elements set to nil' 


        describe 'when initializing with a default value argument' do
          let(:default_value) { :ruby }

          it 'creates an array with size elements set to the default value' 

        end

        describe 'when initializing with a block argument' do
          let(:block_argument) { proc { |index| :"ruby#{index}" } }

          it 'creates an array with size elements set to the default value' 

        end
      end

      describe 'when initializing with another array as an argument' do
        let(:other_array) { [:hello, :world] }
        let(:fake_other_array) { double('Fake array', to_ary: other_array) }

        it 'creates a new array' 


        it 'creates an array with the same contents as the other array' 


        it 'creates an array with the results of calling #to_ary on the other array' 

      end
    end

    context 'concurrency' do
      it do
        (1..Concurrent::ThreadSafe::Test::THREADS).map do |i|
          in_thread(ary) do |ary|
            1000.times do
              ary << i
              ary.each { |x| x * 2 }
              ary.shift
              ary.last
            end
          end
        end.map(&:join)
        expect(ary).to be_empty
      end
    end

    describe '#slice' do
      # This is mostly relevant on Rubinius and TruffleRuby
      it 'correctly initializes the monitor' 

    end
  end
end

