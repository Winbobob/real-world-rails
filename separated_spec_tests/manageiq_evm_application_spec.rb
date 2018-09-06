require "tempfile"
require "fileutils"
require Rails.root.join("lib", "tasks", "evm_application")

describe EvmApplication do
  context ".server_state" do
    it "with a valid status" 


    it "without a database connection" 

  end

  describe ".servers_status" do
    let(:local_zone)  { FactoryGirl.create(:zone, :name => 'A Zone') }
    let(:local)    { EvmSpecHelper.local_miq_server(:started_on => 1.hour.ago, :last_heartbeat => 2.days.ago, :zone => local_zone) }
    let(:remote)   { EvmSpecHelper.remote_miq_server(:is_master => true, :last_heartbeat => nil) }
    let!(:ui)      { FactoryGirl.create(:miq_ui_worker, :miq_server => local, :pid => 80_000) }
    let!(:generic) { FactoryGirl.create(:miq_generic_worker, :miq_server => remote, :pid => 7_000) }
    let!(:refresh) { FactoryGirl.create(:miq_ems_refresh_worker, :miq_server => remote) }

    it "displays server status for local and remote servers" 

  end

  describe ".worker_status" do
    let(:local_zone)  { FactoryGirl.create(:zone, :name => 'A Zone') }
    let(:local)    { EvmSpecHelper.local_miq_server(:started_on => 1.hour.ago, :last_heartbeat => 2.days.ago, :zone => local_zone) }
    let(:remote)   { EvmSpecHelper.remote_miq_server(:is_master => true, :last_heartbeat => nil) }
    let!(:ui)      { FactoryGirl.create(:miq_ui_worker, :miq_server => local, :pid => 80_000) }
    let!(:generic) { FactoryGirl.create(:miq_generic_worker, :miq_server => remote, :pid => 7_000) }
    let!(:refresh) { FactoryGirl.create(:miq_ems_refresh_worker, :miq_server => remote) }

    it "displays worker status for local and remote server" 

  end

  describe ".status" do
    def header(col, adjust = :rjust)
      hdr = col == :WID ? "ID" : col.to_s # edge case
      hdr.gsub("_", " ").send(adjust, send("#{col.downcase}_padding"))
    end

    def line_for(col)
      "-" * send("#{col.downcase}_padding")
    end

    def pad(val, col, adjust = :rjust)
      val.to_s.send(adjust, send("#{col.downcase}_padding"))
    end

    let(:local_zone)  { FactoryGirl.create(:zone, :name => 'A Zone') }
    let(:local)    { EvmSpecHelper.local_miq_server(:started_on => 1.hour.ago, :last_heartbeat => 2.days.ago, :zone => local_zone) }
    let(:remote)   { EvmSpecHelper.remote_miq_server(:is_master => true, :last_heartbeat => nil) }
    let(:rgn)      { local.region_number }
    let!(:ui)      { FactoryGirl.create(:miq_ui_worker, :miq_server => local, :pid => 80_000) }
    let!(:generic) { FactoryGirl.create(:miq_generic_worker, :miq_server => remote, :pid => 7_000) }
    let!(:refresh) { FactoryGirl.create(:miq_ems_refresh_worker, :miq_server => remote) }

    let(:local_started_on)  { local.started_on.strftime("%H:%M:%S%Z") }
    let(:local_heartbeat)   { local.last_heartbeat.strftime("%Y-%m-%d") }

    let(:pid_padding)       { ["PID", ui.pid.to_s, generic.pid.to_s].map(&:size).max }
    let(:zone_padding)      { local.zone.name.to_s.size }
    let(:started_padding)   { ["Started", local_started_on].map(&:size).max }
    let(:heartbeat_padding) { ["Heartbeat", local_heartbeat].map(&:size).max }
    let(:region_padding)    { 6 }

    context "for just the local server" do
      it "displays server status for the local server and it's workers" 

    end

    context "with remote servers" do
      let(:remote_started_on) { remote.started_on.strftime("%H:%M:%S%Z") }

      let(:pid_padding)       { MiqWorker.all.pluck(:pid).map { |pid| pid.to_s.size }.unshift(3).max }
      let(:zone_padding)      { ["Zone", local.zone.name.to_s, remote.zone.name.to_s].map(&:size).max }
      let(:started_padding)   { ["Started", remote_started_on, local_started_on].map(&:size).max }

      it "displays server status for the all servers and workers" 

    end
  end

  context ".queue_status" do
    it "calculates oldest and counts" 


    it "groups zone together" 

  end

  context ".update_start" do
    it "was running" 


    it "was not running" 

  end

  context ".update_stop" do
    it "was running" 


    it "was not running" 

  end

  describe ".set_region_file" do
    let(:region_file) { Pathname.new(Tempfile.new("REGION").path) }

    after do
      FileUtils.rm_f(region_file)
    end

    context "when the region file exists" do
      it "writes the new region if the regions differ" 


      it "does not write the region if the regions are the same" 

    end

    context "when the region file does not exist" do
      before do
        FileUtils.rm_f(region_file)
      end

      it "creates the file with the new region number" 

    end
  end

  describe ".deployment_status" do
    it "returns new_deployment if the database is not migrated" 


    it "returns new_replica if the current server is not seeded" 


    it "returns upgrade if we need to migrate the database" 


    it "returns redeployment otherwise" 

  end

  describe ".encryption_key_valid?" do
    it "returns true when we are using the correct encryption key" 

  end
end

