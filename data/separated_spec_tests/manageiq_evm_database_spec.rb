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
end

