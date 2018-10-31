require 'manageiq-postgres_ha_admin'

describe EvmDatabase do
  subject { described_class }
  context "#local?" do
    ["localhost", "127.0.0.1", "", nil].each do |host|
      it "should know #{host} is local" 

    end

    it "should know otherhost is not local" 

  end

  context "#seed_primordial" do
    it "populates seeds" 

  end

  describe ".find_seedable_model_class_names" do
    it "returns ordered classes first" 

  end

  describe ".raise_server_event" do
    it "adds to queue request to raise 'evm_event'" 

  end

  describe ".restart_failover_monitor_service" do
    let(:service) { instance_double(LinuxAdmin::SystemdService) }

    before do
      expect(LinuxAdmin::Service).to receive(:new).and_return(service)
    end

    it "restarts the service when running" 


    it "doesn't restart the service when it isn't running" 

  end

  describe ".restart_failover_monitor_service_queue" do
    it "queues a message for the correct role and zone" 

  end

  describe ".run_failover_monitor" do
    let!(:server) { EvmSpecHelper.local_guid_miq_server_zone[1] }
    let(:monitor) { ManageIQ::PostgresHaAdmin::FailoverMonitor.new }
    let(:subscriptions) do
      [
        PglogicalSubscription.new(:id => "sub_id_1"),
        PglogicalSubscription.new(:id => "sub_id_2")
      ]
    end

    before do
      allow(PglogicalSubscription).to receive(:all).and_return(subscriptions)
      expect(monitor).to receive(:monitor_loop)
    end

    it "adds a rails handler for the environment in database.yml" 


    it "adds a pglogical config handler for every subscription when our server has the database_operations role" 

  end
end

