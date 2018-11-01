describe PidFile do
  before do
    @fname = 'foo.bar'
    @pid_file = PidFile.new(@fname)
  end

  context "#pid" do
    it "returns nil when file does not exist" 


    context "file does exist" do
      before do
        allow(File).to receive(:file?).with(@fname).and_return(true)
      end

      it "returns nil when file contents blank" 


      it "returns nil when file contents are non numeric" 


      it "returns pid when file contents have pid" 

    end
  end

  context "#remove" do
    it "noops when file does not exist" 


    it "deletes when file exist and is our process" 

  end

  context "#create" do
    it "creates file whose contents are Process.pid" 

  end

  context "#running?" do
    it "returns false if #pid returns nil" 


    context "#pid returns valid value" do
      before do
        @pid = 42
        allow(@pid_file).to receive(:pid).and_return(@pid)
      end

      it "returns false if MiqProcess.command_line returns nil" 


      it "returns false if MiqProcess.command_line returns an empty string" 


      context "MiqProcess.command_line returns valid value" do
        before do
          @cmd_line = "my favorite program"
          allow(MiqProcess).to receive(:command_line).and_return(@cmd_line)
        end

        it "returns true with no parms" 


        it "returns true with valid Regexp" 


        it "returns true with valid Regexp as String" 


        it "returns false with invalid Regexp" 


        it "returns false with invalid Regexp as String" 

      end
    end
  end
end

