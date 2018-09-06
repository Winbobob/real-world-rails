require 'spec_helper'

RSpec.describe RSpec::Sidekiq::Matchers::HaveEnqueuedJob do
  let(:tomorrow) { DateTime.now + 1 }
  let(:interval) { 3.minutes }
  let(:argument_subject) { RSpec::Sidekiq::Matchers::HaveEnqueuedJob.new worker_args }
  let(:matcher_subject) { RSpec::Sidekiq::Matchers::HaveEnqueuedJob.new [be_a(String), be_a(Fixnum), true, be_a(Hash)] }
  let(:worker) { create_worker }
  let(:worker_args) { ['string', 1, true, { key: 'value', bar: :foo, nested: [{hash: true}] }] }
  let(:active_job) { create_active_job :mailers }
  let(:resource) { TestResource.new }

  before(:each) do
    worker.perform_async *worker_args
    active_job.perform_later 'someResource'
    active_job.perform_later(resource)
    TestActionMailer.testmail.deliver_later
    TestActionMailer.testmail(resource).deliver_later
  end

  describe 'expected usage' do
    context 'Sidekiq' do
      it 'matches' 


      it 'matches on the global Worker queue' 


      context 'perform_in' do
        let(:worker_args_in) { worker_args + ['in'] }

        before(:each) do
          worker.perform_in 3.minutes, *worker_args_in
        end

        it 'matches on an scheduled job with #perform_in' 

      end

      context 'perform_at' do
        let(:worker_args_at) { worker_args + ['at'] }

        before(:each) do
          worker.perform_at tomorrow, *worker_args_at
        end

        it 'matches on an scheduled job with #perform_at' 

      end
    end

    context 'ActiveJob' do
      it 'matches on an enqueued ActiveJob' 


      it 'matches on an enqueued ActiveJob by global_id' 

    end

    context 'ActionMailer' do
      it 'matches on ActionMailer Job' 


      it 'matches on ActionMailer with a resource Job' 

    end
  end

  describe '#have_enqueued_sidekiq_job' do
    it 'returns instance' 

  end

  describe '#have_enqueued_job' do
    it 'returns instance' 


    it 'provides deprecation warning' 


    it 'matches the same way have_enqueued_sidekiq_job does' 

  end

  describe '#description' do
    it 'returns description' 

  end

  describe '#failure_message' do
    it 'returns message' 

  end

  describe '#failure_message_when_negated' do
    it 'returns message' 

  end

  describe '#matches?' do
    context 'when condition matches' do
      context 'when expected are arguments' do
        it 'returns true' 

      end

      context 'when expected are matchers' do
        it 'returns true' 

      end

      context 'when job is scheduled' do
        context 'with #perform_at' do
          before(:each) do
            worker.perform_at(tomorrow, *worker_args)
          end

          context 'and timestamp matches' do
            it 'returns true' 

          end

          context 'and timestamp does not match' do
            it 'returns false' 

          end
        end

        context 'with #perform_in' do
          before(:each) do
            worker.perform_in(interval, *worker_args)
          end

          context 'and interval matches' do
            it 'returns true' 

          end

          context 'and interval does not match' do
            it 'returns false' 

          end
        end
      end
    end

    context 'when condition does not match' do
      before(:each) { Sidekiq::Worker.clear_all }

      context 'when expected are arguments' do
        it 'returns false' 

      end

      context 'when expected are matchers' do
        it 'returns false' 

      end

      context 'when job is scheduled' do
        context 'with #perform_at' do
          before(:each) do
            allow(matcher_subject).to receive(:options).and_return(at: tomorrow + 1)
          end

          it 'returns false' 

        end

        context 'with #perform_in' do
          before(:each) do
            allow(matcher_subject).to receive(:options).and_return(in: interval + 1)
          end

          it 'returns false' 

        end
      end
    end
  end
end

