require 'spec_helper'
require 'open_food_network/products_cache_refreshment'

module OpenFoodNetwork
  describe ProductsCacheRefreshment do
    let(:distributor) { create(:distributor_enterprise) }
    let(:order_cycle) { create(:simple_order_cycle) }

    before { Delayed::Job.destroy_all }

    describe "when there are no tasks enqueued" do
      it "enqueues the task" 


      it "enqueues the job with a lower than default priority" 

    end

    describe "when there is an enqueued task, and it is running" do
      before do
        job = Delayed::Job.enqueue RefreshProductsCacheJob.new distributor.id, order_cycle.id
        job.update_attributes! locked_by: 'asdf', locked_at: Time.now
      end

      it "enqueues another task" 

    end

    describe "when there are two enqueued tasks, and one is running" do
      before do
        job1 = Delayed::Job.enqueue RefreshProductsCacheJob.new distributor.id, order_cycle.id
        job1.update_attributes! locked_by: 'asdf', locked_at: Time.now
        job2 = Delayed::Job.enqueue RefreshProductsCacheJob.new distributor.id, order_cycle.id
      end

      it "does not enqueue another task" 

    end

    describe "enqueuing tasks with different distributions" do
      let(:distributor2) { create(:distributor_enterprise) }
      let(:order_cycle2) { create(:simple_order_cycle) }

      before do
        job1 = Delayed::Job.enqueue RefreshProductsCacheJob.new distributor.id, order_cycle.id
        job1.update_attributes! locked_by: 'asdf', locked_at: Time.now
        job2 = Delayed::Job.enqueue RefreshProductsCacheJob.new distributor.id, order_cycle.id
      end

      it "ignores tasks with differing distributions when choosing whether to enqueue a job" 

    end
  end
end

