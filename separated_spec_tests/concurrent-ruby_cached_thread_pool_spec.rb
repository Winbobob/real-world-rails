require_relative 'thread_pool_shared'

module Concurrent

  RSpec.describe CachedThreadPool do

    subject do
      described_class.new(fallback_policy: :discard)
    end

    after(:each) do
      subject.kill
      subject.wait_for_termination(1)
    end

    it_should_behave_like :thread_pool

    let(:latch) { Concurrent::CountDownLatch.new }

    context '#initialize' do

      it 'sets :max_length to DEFAULT_MAX_POOL_SIZE' 


      it 'sets :min_length to DEFAULT_MIN_POOL_SIZE' 


      it 'sets :idletime to DEFAULT_THREAD_IDLETIMEOUT' 


      it 'sets :max_queue to DEFAULT_MAX_QUEUE_SIZE' 

    end

    context '#min_length' do

      it 'returns zero on creation' 


      it 'returns zero while running' 


      it 'returns zero once shutdown' 

    end

    context '#max_length' do

      it 'returns :max_length on creation' 


      it 'returns :max_length while running' 


      it 'returns :max_length once shutdown' 

    end

    context '#largest_length' do

      it 'returns zero on creation' 


      it 'returns a non-zero number once tasks have been received' 


      it 'returns a non-zero number after shutdown if tasks have been received' 

    end

    context '#idletime' do

      subject{ described_class.new(idletime: 42) }

      it 'returns the thread idletime' 

    end

    context 'runtime-specific implementation' do

      if Concurrent.on_jruby?

        context '#initialize' do

          it 'sets :fallback_policy correctly' 


          it 'defaults :fallback_policy to :abort' 


          it 'raises an exception if given an invalid :fallback_policy' 

        end

      else

        context 'garbage collection' do

          subject { described_class.new(idletime: 0.1, max_threads: 2, gc_interval: 0) }

          it 'removes from pool any thread that has been idle too long' 


          it 'deals with dead threads' 

        end

        context 'worker creation and caching' do

          subject { described_class.new(idletime: 1, max_threads: 5) }

          it 'creates new workers when there are none available' 


          it 'uses existing idle threads' 

        end
      end

      context 'stress', notravis: true do
        configurations = [
          { min_threads:     2,
            max_threads:     ThreadPoolExecutor::DEFAULT_MAX_POOL_SIZE,
            auto_terminate:  false,
            idletime:        0.1, # 1 minute
            max_queue:       0, # unlimited
            fallback_policy: :caller_runs, # shouldn't matter -- 0 max queue
            gc_interval:     0.1 },
            { min_threads:     2,
              max_threads:     4,
              auto_terminate:  false,
              idletime:        0.1, # 1 minute
              max_queue:       0, # unlimited
              fallback_policy: :caller_runs, # shouldn't matter -- 0 max queue
              gc_interval:     0.1 }
        ]

        configurations.each do |config|
          specify do
            pool = RubyThreadPoolExecutor.new(config)

            10.times do
              count = Concurrent::CountDownLatch.new(100)
              100.times do
                pool.post { count.count_down }
              end
              count.wait
              sleep 0.01 # let the tasks end after count_down
              expect(pool.length).to be <= [200, config[:max_threads]].min
              if pool.length > [110, config[:max_threads]].min
                puts "ERRORSIZE #{pool.length} max #{config[:max_threads]}"
              end
            end
          end
        end
      end
    end
  end
end

