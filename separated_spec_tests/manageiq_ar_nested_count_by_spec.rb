describe "AR Nested Count By extension" do
  context "miq_queue with messages" do
    before do
      @zone = EvmSpecHelper.local_miq_server.zone

      FactoryGirl.create(:miq_queue, :zone => @zone.name, :state => MiqQueue::STATE_DEQUEUE,  :role => "role1", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => @zone.name, :state => MiqQueue::STATE_DEQUEUE,  :role => "role1", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => @zone.name, :state => MiqQueue::STATE_DEQUEUE,  :role => "role2", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => @zone.name, :state => MiqQueue::STATE_READY,    :role => "role1", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => @zone.name, :state => MiqQueue::STATE_READY,    :role => "role1", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => @zone.name, :state => MiqQueue::STATE_READY,    :role => "role1", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => "east",     :state => MiqQueue::STATE_DEQUEUE,  :role => "role1", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => "west",     :state => MiqQueue::STATE_READY,    :role => "role3", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => @zone.name, :state => MiqQueue::STATE_ERROR,    :role => "role1", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => @zone.name, :state => MiqQueue::STATE_WARN,     :role => "role3", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => "east",     :state => MiqQueue::STATE_DEQUEUE,  :role => "role1", :priority => 20)
      FactoryGirl.create(:miq_queue, :zone => "west",     :state => MiqQueue::STATE_ERROR,    :role => "role2", :priority => 20)
    end

    it "should count by state, zone and role" 


    it "should respect nested where, and support individual args (vs an array)" 


    it "should count by role and state" 

  end
end

