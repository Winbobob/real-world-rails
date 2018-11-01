describe Vmdb::Settings do
  describe ".on_reload" do
    it "is called on top-level ::Settings.reload!" 


    it "updates the last_loaded time" 


    context "dumping the settings to the log directory" do
      it "writes them" 


      it "masks passwords" 

    end
  end

  it ".walk" 


  describe ".save!" do
    let(:miq_server) { FactoryGirl.create(:miq_server) }

    it "does not allow invalid configuration values" 


    it "with a change" 


    it "with a change with string keys" 


    it "with a change with mixed keys" 


    it "with a previous change, now back to the default" 


    it "with a previous change, now to a new value" 


    it "with a mix of changes" 


    it "with a previous change, now not specified" 


    it "with previous changes, but only specifying one of them" 


    it "with a change to an Array" 


    it "encrypts password fields" 


    it "saving settings for Zone does not change saved Region or Server settings" 


    it "saving settings for Region does not change saved Zone or Server settings" 


    describe described_class::RESET_COMMAND do
      let(:server_value) { "server" }
      let(:zone_value)   { "zone" }
      let(:region_value) { "region" }
      let(:server_array_value) { [{:key1 => server_value}, {:key1 => server_value}] }
      let(:zone_array_value)   { [{:key1 => zone_value},   {:key1 => zone_value}] }

      let(:reset) { described_class::RESET_COMMAND }

      before do
        MiqRegion.seed

        described_class.save!(
          MiqRegion.first,
          :api     => {
            :token_ttl              => region_value,
            :authentication_timeout => region_value
          },
          :session => {:timeout => 2}
        )
        described_class.save!(
          miq_server.zone,
          :api   => {
            :token_ttl => zone_value
          },
          :array => zone_array_value
        )
        described_class.save!(
          miq_server,
          :api     => {
            :token_ttl              => server_value,
            :authentication_timeout => server_value,
            :new_key                => "new value"
          },
          :session => {:timeout => 1},
          :array   => server_array_value
        )
      end

      it "inherits a leaf-level value from the parent" 


      it "inherits a node-level value from the parent" 


      it "inherits an array from the parent" 


      it "deletes a leaf-level value not present in the parent" 


      it "deletes a leaf-level value not present in the parent when reset at the node level" 


      it "deletes an array value not present in the parent" 


      it "at a parent level does not push down changes to children" 


      it "passes validation" 

    end
  end

  describe "save_yaml!" do
    let(:miq_server) { FactoryGirl.create(:miq_server) }

    it "saves the settings" 


    it "handles incoming unencrypted values" 


    it "handles incoming encrypted values" 


    {
      "syntax"     => "--- -", # invalid YAML
      "non-syntax" => "xxx"    # valid YAML, but invalid config
    }.each do |type, contents|
      it "catches #{type} errors" 

    end
  end

  shared_examples_for "password handling" do
    subject do
      described_class.send(method, Settings)
      Settings.to_hash
    end

    it "with password" 


    it "with converted password" 


    it "with password set to nil" 


    it "with password set to blank" 


    it "ignores non-password keys" 


    it "handles deeply nested passwords" 


    it "handles deeply nested passwords in arrays" 


    it "handles all password keys" 

  end

  describe ".encrypt_passwords!" do
    let(:method)   { :encrypt_passwords! }
    let(:initial)  { "pa$$word" }
    let(:expected) { MiqPassword.encrypt(initial) }

    include_examples "password handling"
  end

  describe ".decrypt_passwords!" do
    let(:method)   { :decrypt_passwords! }
    let(:initial)  { MiqPassword.encrypt(expected) }
    let(:expected) { "pa$$word" }

    include_examples "password handling"
  end

  describe ".mask_passwords!" do
    let(:method)   { :mask_passwords! }
    let(:initial)  { "pa$$word" }
    let(:expected) { "********" }

    include_examples "password handling"
  end

  describe ".for_resource" do
    let(:server) { FactoryGirl.create(:miq_server) }

    it "without database changes" 


    it "with database changes" 


    it "with database changes on an Array" 


    it "can load settings on each level from Region -> Zone -> Server hierarchy" 


    it "applies settings from up the hierarchy: Region -> Zone -> Server" 

  end

  describe ".for_resource_yaml" do
    it "fetches the yaml with changes" 


    it "ensures passwords are encrypted" 

  end

  it "with .local file" 

end

