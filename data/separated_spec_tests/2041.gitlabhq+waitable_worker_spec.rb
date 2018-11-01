require 'spec_helper'

describe WaitableWorker do
  let(:worker) do
    Class.new do
      def self.name
        'Gitlab::Foo::Bar::DummyWorker'
      end

      cattr_accessor(:counter) { 0 }

      include ApplicationWorker
      prepend WaitableWorker

      # This is a workaround for a Ruby 2.3.7 bug. rspec-mocks cannot restore
      # the visibility of prepended modules. See
      # https://github.com/rspec/rspec-mocks/issues/1231 for more details.
      def self.bulk_perform_inline(args_list)
      end

      def perform(count = 0)
        self.class.counter += count
      end
    end
  end

  subject(:job) { worker.new }

  describe '.bulk_perform_and_wait' do
    it 'schedules the jobs and waits for them to complete' 


    it 'inlines workloads <= 3 jobs' 


    it 'runs > 3 jobs using sidekiq' 

  end

  describe '.bulk_perform_inline' do
    it 'runs the jobs inline' 


    it 'enqueues jobs if an error is raised' 

  end

  describe '#perform' do
    shared_examples 'perform' do
      it 'notifies the JobWaiter when done if the key is provided' 


      it 'does not notify the JobWaiter when done if no key is provided' 

    end

    context 'when the worker takes arguments' do
      let(:args) { [1] }

      it_behaves_like 'perform'
    end

    context 'when the worker takes no arguments' do
      let(:args) { [] }

      it_behaves_like 'perform'
    end
  end
end

