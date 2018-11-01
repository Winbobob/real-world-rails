require_relative 'thread_pool_shared'

module Concurrent

  RSpec.describe FixedThreadPool do

    let!(:num_threads){ 5 }
    subject { described_class.new(num_threads) }

    after(:each) do
      subject.shutdown
      expect(subject.wait_for_termination(pool_termination_timeout)).to eq true
    end

    it_should_behave_like :thread_pool

    let(:latch) { Concurrent::CountDownLatch.new }

    context '#initialize default values' do

      subject { described_class.new(5) }

      it 'defaults :min_length correctly' 


      it 'defaults :max_length correctly' 


      it 'defaults :fallback_policy to :abort' 



      it 'defaults :idletime correctly' 


      it 'defaults default :max_queue to zero' 


    end

    context '#initialize explicit values' do

      it 'raises an exception when the pool length is less than one' 



      it 'sets explicit :max_queue correctly' 


      it 'correctly sets valid :fallback_policy' 


      it "correctly sets valid :idletime" 


      it 'raises an exception if given an invalid :fallback_policy' 

    end

    context '#min_length' do

      it 'returns :num_threads on creation' 


      it 'returns :num_threads while running' 


      it 'returns :num_threads once shutdown' 

    end

    context '#max_length' do

      it 'returns :num_threads on creation' 


      it 'returns :num_threads while running' 


      it 'returns :num_threads once shutdown' 

    end

    context '#length' do

      it 'returns :num_threads while running' 

    end

    context '#largest_length' do

      it 'returns zero on creation' 


      it 'returns :num_threads while running' 


      it 'returns :num_threads once shutdown' 

    end

    context '#kill' do

      it 'attempts to kill all in-progress tasks' 

    end

    context 'worker creation and caching' do

      it 'never creates more than :num_threads threads' 

    end

    context 'fallback policy' do

      before(:each) do
        @queue = Queue.new
      end

      after(:each) do
        subject.shutdown
      end

      # On abort, it should raise an error
      it "raises an error when overflow on abort" 


      # On discard, we'd expect no error, but also not all five results
      it 'discards when fallback_policy is :discard' 


      # To check for caller_runs, we'll check how many unique threads
      # actually ran the block

      it 'uses the calling thread for overflow under caller_runs' 

    end

    context 'runtime-specific implementation' do

      if Concurrent.on_jruby?

        it 'sets :fallback_policy correctly' 


      else

        context 'exception handling' do

          it 'restarts threads that experience exception' 

        end

        context 'worker creation and caching' do

          it 'creates new workers when there are none available' 

        end
      end
    end
  end
end

