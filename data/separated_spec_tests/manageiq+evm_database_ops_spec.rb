require 'util/runcmd'
describe EvmDatabaseOps do
  let(:file_storage) { double("MiqSmbSession", :disconnect => nil) }
  let(:local_backup) { "/tmp/backup_1" }
  let(:input_path)   { "foo/bar/mkfifo" }
  let(:run_db_ops)   { @db_opts.dup.merge(:local_file => input_path) }
  let(:tmpdir)       { Rails.root.join("tmp") }

  before do
    allow(MiqFileStorage).to receive(:with_interface_class).and_yield(file_storage)
  end

  context "#backup" do
    before do
      @connect_opts = {:username => 'blah', :password => 'blahblah', :uri => "smb://myserver.com/share"}
      @db_opts      = {:username => 'root', :dbname => 'vmdb_production' }
      allow(file_storage).to   receive(:settings_mount_point).and_return(tmpdir.to_s)
      allow(file_storage).to   receive(:uri_to_local_path).and_return(tmpdir.join("share").to_s)
      allow(file_storage).to   receive(:add).and_yield(input_path)

      allow(FileUtils).to      receive(:mv).and_return(true)
      allow(EvmDatabaseOps).to receive(:backup_destination_free_space).and_return(200.megabytes)
      allow(EvmDatabaseOps).to receive(:database_size).and_return(100.megabytes)
    end

    it "locally" 


    it "defaults" 


    it "splits files with a local file" 


    it "without enough free space" 


    it "remotely" 


    it "remotely without a remote file name" 


    it "properly logs the result with no :dbname provided" 

  end

  context "#dump" do
    let(:local_dump) { "/tmp/dump_1" }
    before do
      @connect_opts = {:username => 'blah', :password => 'blahblah', :uri => "smb://myserver.com/share"}
      @db_opts =      {:dbname => 'vmdb_production', :username => 'root'}
      allow(MiqSmbSession).to receive(:runcmd)
      allow(file_storage).to  receive(:settings_mount_point).and_return(tmpdir)
      allow(file_storage).to  receive(:add).and_yield(input_path)

      allow(MiqUtil).to        receive(:runcmd)
      allow(PostgresAdmin).to  receive(:runcmd_with_logging)
      allow(FileUtils).to      receive(:mv).and_return(true)
      allow(EvmDatabaseOps).to receive(:backup_destination_free_space).and_return(200.megabytes)
      allow(EvmDatabaseOps).to receive(:database_size).and_return(100.megabytes)
    end

    it "locally" 


    it "defaults" 


    it "splits files with a local file" 


    it "without enough free space" 


    it "remotely" 


    it "remotely without a remote file name" 

  end

  context "#restore" do
    before do
      @connect_opts = {:username => 'blah', :password => 'blahblah'}
      @db_opts =      {:dbname => 'vmdb_production', :username => 'root'}

      allow(MiqSmbSession).to receive(:runcmd)
      allow(MiqSmbSession).to receive(:raw_disconnect)
      allow(file_storage).to  receive(:settings_mount_point).and_return(tmpdir)
      allow(file_storage).to  receive(:download).and_yield(input_path)

      allow(PostgresAdmin).to receive(:runcmd_with_logging)
      allow(PostgresAdmin).to receive(:pg_dump_file?).and_return(true)
      allow(PostgresAdmin).to receive(:base_backup_file?).and_return(false)

      allow(VmdbDatabaseConnection).to receive(:count).and_return(1)
    end

    it "from local backup" 


    it "from smb backup" 


    it "properly logs the result with no :dbname provided" 

  end

  describe "with_file_storage (private method)" do
    let(:db_opts)       { {} }
    let(:connect_opts)  { {} }

    # convenience_wrapper for private method
    def execute_with_file_storage(action = :backup)
      described_class.send(:with_file_storage, action, db_opts, connect_opts) do |dbopts|
        yield dbopts if block_given?
      end
    end

    shared_examples "default with_file_storage behaviors" do
      it "sets dbopts[:local_file] to the input_path" 


      it "updates db_opts for the block to set the :dbname" 


      context "db_opts[:dbname] is set" do
        it "does not update :dbname if passed" 

      end
    end

    context "with a local file" do
      let(:db_opts) { { :local_file => "/tmp/foo" } }

      before { expect(file_storage).to receive(:add).and_yield(input_path) }

      include_examples "default with_file_storage behaviors"

      it "always uses a file_storage interface" 


      it "does not try to close a session" 


      it "updates the db_opts[:local_file] to the file_storage fifo" 


      it "returns the result of the block" 

    end

    context "without a local file" do
      let(:connect_opts) { { :uri => "smb://tmp/foo" } }

      before { allow(file_storage).to receive(:add).and_yield(input_path) }

      include_examples "default with_file_storage behaviors"

      context "for a backup-ish action" do
        let(:backup_file) { "/tmp/bar/baz" }

        before { allow(described_class).to receive(:backup_file_name).and_return(backup_file) }

        it "updates db_opts[:local_file] in the method context" 


        it "respects user passed in connect_opts[:remote_file_name]" 


        it "returns calculated uri" 

      end

      context "for a restore action" do
        it "updates db_opts[:local_file] in the method context" 


        it "returns calculated uri" 

      end
    end
  end
end

