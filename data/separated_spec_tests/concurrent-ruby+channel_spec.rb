module Concurrent

 RSpec.describe Channel, edge: true, notravis: true do

    context 'initialization' do

      it 'raises an exception when the :buffer is invalid' 


      it 'is :unbuffered when neither :buffer nore :capacity is given' 


      it 'is :unbuffered when :unbuffered is given' 


      it 'is :unbuffered when :buffered and capacity: 0' 


      it 'raises an exception when both :unbuffered and :capacity are given' 


      it 'is :buffered when :capacity > 0 and no :buffer given' 


      it 'is :buffered when :buffered given' 


      it 'raises an exception when :buffered given without :capacity' 


      it 'raises an exception when :buffered and :capacity < 0' 


      it 'is :dropping when :dropping and :capacity > 0' 


      it 'raises an exception when :dropping given without :capacity' 


      it 'raises an exception when :dropping and :capacity < 1' 


      it 'is :sliding when :sliding and :capacity > 0' 


      it 'raises an exception when :sliding given without :capacity' 


      it 'raises an exception when :sliding and :capacity < 1' 


      it 'uses the given buffer' 

    end

    context 'factories' do

      specify do
        expect(Channel::Buffer::Ticker).to receive(:new).with(10).and_call_original
        Channel.ticker(10)
      end

      specify do
        expect(Channel::Buffer::Timer).to receive(:new).with(10).and_call_original
        Channel.timer(10)
      end
    end

    context '#put' do

      it 'returns true on success' 


      it 'returns false on failure' 


      it 'rejects when the validator returns false' 


      it 'rejects when the validator raises an exception' 


      it 'rejects nil' 

    end

    context 'put!' do

      it 'returns true on success' 


      it 'raises an exception on failure' 


      it 'rejects when the validator returns false' 


      it 'rejects when the validator raises an exception' 


      it 'rejects nil' 

    end

    context 'put?' do

      it 'returns a just Maybe on success' 


      it 'returns a nothing Maybe on failure' 


      it 'rejects when the validator returns false' 


      it 'rejects when the validator raises an exception' 


      it 'accepts nil' 

    end

    context '#offer' do

      it 'returns true on success' 


      it 'returns false on failure' 


      it 'rejects when the validator returns false' 


      it 'rejects when the validator raises an exception' 


      it 'rejects nil' 

    end

    context 'offer!' do

      it 'returns true on success' 


      it 'raises an exception on failure' 


      it 'rejects when the validator returns false' 


      it 'rejects when the validator raises an exception' 


      it 'rejects nil' 

    end

    context 'offer?' do

      it 'returns a just Maybe on success' 


      it 'returns a nothing Maybe on failure' 


      it 'rejects when the validator returns false' 


      it 'rejects when the validator raises an exception' 


      it 'accepts nil' 

    end

    context '#take' do

      subject { Channel.new(buffer: :buffered, capacity: 2) }

      it 'takes the next item when not empty' 


      it 'returns nil on failure' 

    end

    context '#take!' do

      subject { Channel.new(buffer: :buffered, capacity: 2) }

      it 'takes the next item when not empty' 


      it 'raises an exception on failure' 

    end

    context '#take?' do

      subject { Channel.new(buffer: :buffered, capacity: 2) }

      it 'returns a just Maybe on success' 


      it 'returns a nothing Maybe on failure' 

    end

    context '#next' do

      subject { Channel.new(buffer: :buffered, capacity: 3) }

      it 'returns <item>, true when there is one item' 


      it 'returns <item>, true when there are multiple items' 


      it 'returns nil, false when empty and closed' 


      it 'returns <item>, true when closed and last item' 


      it 'returns nil, false when closed and no items remain' 

    end

    context '#next?' do

      subject { Channel.new(buffer: :buffered, capacity: 2) }

      it 'returns a just Maybe and true when there is one item' 


      it 'returns a just Maybe, true when there are multiple items' 


      it 'returns a nothing Maybe and false on failure' 

    end

    context '#poll' do

      it 'returns the next item immediately if available' 


      it 'returns nil immediately if no item is available' 


      it 'returns nil on failure' 

    end

    context '#poll!' do

      it 'returns the next item immediately if available' 


      it 'raises an exception immediately if no item is available' 


      it 'raises an exception on failure' 

    end

    context '#poll?' do

      it 'returns a just Maybe immediately if available', notravis: true do
        subject # initialize on this thread
        t = in_thread do
          subject.put(42)
        end
        t.join(0.1)

        result = subject.poll?
        expect(result).to be_a Concurrent::Maybe
        expect(result).to be_just
        expect(result.value).to eq 42
      end

      it 'returns a nothing Maybe immediately if no item is available' 


      it 'returns a nothing Maybe on failure' 

    end

    context '.each' do

      it 'raises and exception when no block is given' 


      it 'iterates until the channel is closed' 

    end

    context 'goroutines', notravis: true do

      let(:default_executor) { Channel.const_get(:GOROUTINES) }

      context '.go' do

        it 'raises an exception when no block is given' 


        specify do
          expect(default_executor).to receive(:post).with(1, 2, 3)
          Channel.go(1, 2, 3) { nil }
        end
      end

      context '.go_via' do

        it 'raises an exception when no block is given' 


        specify do
          executor = ImmediateExecutor.new
          expect(executor).to receive(:post).with(1, 2, 3)
          Channel.go_via(executor, 1, 2, 3) { nil }
        end
      end

      context '.go_loop' do

        it 'raises an exception when no block is given' 


        it 'loops until the block returns false' 

      end

      context '.go_loop_via' do

        it 'raises an exception when no block is given' 


        it 'loops until the block returns false' 

      end
    end

    context 'select' do

      it 'raises an exception when no block is given' 


      it 'passes a selector to the block' 


      specify do
        expect_any_instance_of(Channel::Selector).to receive(:execute)
        Channel.select { |s| s.error {  } }
      end
    end
 end
end

