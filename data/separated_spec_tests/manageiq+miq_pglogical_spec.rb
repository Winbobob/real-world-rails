describe MiqPglogical do
  context "requires pglogical been installed" do
    let(:connection) { ApplicationRecord.connection }
    let(:pglogical)  { connection.pglogical }

    before do
      skip "pglogical must be installed" unless pglogical.installed?
      MiqServer.seed
    end

    describe "#active_excludes" do
      it "returns an empty array if a provider is not configured" 

    end

    describe "#provider?" do
      it "is false when a provider is not configured" 

    end

    describe "#node?" do
      it "is false when a provider is not configured" 

    end

    describe "#configure_provider" do
      it "enables the extenstion and creates the replication set" 


      it "does not enable the extension when an exception is raised" 

    end

    context "when configured as a provider" do
      before do
        subject.configure_provider
      end

      describe "#active_excludes" do
        it "returns the initial set of excluded tables" 

      end

      describe "#provider?" do
        it "is true" 

      end

      describe "#node?" do
        it "is true" 

      end

      describe "#destroy_provider" do
        it "removes the provider configuration" 

      end

      describe "#create_replication_set" do
        it "creates the correct initial set" 

      end

      describe ".refresh_excludes" do
        it "sets the configured excludes and calls refresh on an instance" 

      end

      describe "#refresh_excludes" do
        it "adds a new non excluded table" 


        it "removes a newly excluded table" 


        it "adds a newly included table" 

      end
    end

    describe ".region_to_node_name" do
      it "returns the correct name" 

    end

    describe ".node_name_to_region" do
      it "returns the correct region" 

    end
  end

  describe ".save_remote_region" do
    it "sets replication type for this region to 'remote'" 


    it "updates list of tables to be excluded from replication" 


    it "does not updates list of tables to be excluded from replication if passed parameter is empty" 

  end

  describe ".save_global_region" do
    let(:subscription) { double }
    it "sets replication type for this region to 'global'" 


    it "deletes subscriptions passed as second paramer" 


    it "saves subscriptions passed as first paramer" 

  end
end

