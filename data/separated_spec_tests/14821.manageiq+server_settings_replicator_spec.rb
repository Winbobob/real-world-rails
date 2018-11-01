$LOAD_PATH << Rails.root.join("tools").to_s

require "server_settings_replicator/server_settings_replicator"

describe ServerSettingsReplicator do
  let(:miq_server) { EvmSpecHelper.local_miq_server }
  let!(:miq_server_remote) { EvmSpecHelper.remote_miq_server }
  let(:settings) { {:k1 => {:k2 => {:k3 => 'v3'}}} }

  describe "#replicate" do
    it "targets only other servers" 

  end

  describe "#construct_setting_tree" do
    it "handle simple value" 


    it "handle hash value" 

  end
end

