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

  it "with .local file" 

end

