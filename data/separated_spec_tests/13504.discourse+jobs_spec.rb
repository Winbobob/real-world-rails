require 'rails_helper'
require_dependency 'jobs/base'

describe Jobs do

  describe 'enqueue' do

    describe 'when queue_jobs is true' do
      before do
        SiteSetting.expects(:queue_jobs?).at_least_once.returns(true)
      end

      it 'enqueues a job in sidekiq' 


      it "does not pass current_site_id when 'all_sites' is present" 


      it "doesn't execute the job" 


      it "should enqueue with the correct database id when the current_site_id option is given" 

    end

    describe 'when queue_jobs is false' do
      before do
        SiteSetting.expects(:queue_jobs?).at_least_once.returns(false)
      end

      it "doesn't enqueue in sidekiq" 


      it "executes the job right away" 


      context 'and current_site_id option is given and does not match the current connection' do
        before do
          Sidekiq::Client.stubs(:enqueue)
          Jobs::ProcessPost.any_instance.stubs(:execute).returns(true)
        end

        it 'should raise an exception' 

      end
    end

  end

  describe 'cancel_scheduled_job' do
    let(:scheduled_jobs) { Sidekiq::ScheduledSet.new }

    after do
      scheduled_jobs.clear
    end

    it 'deletes the matching job' 


  end

  describe 'enqueue_at' do
    it 'calls enqueue_in for you' 


    it 'handles datetimes that are in the past' 

  end

end

