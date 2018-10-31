require 'util/runcmd'
describe EvmDatabaseOps do
  context "#backup" do
    before do
      @connect_opts = {:username => 'blah', :password => 'blahblah', :uri => "smb://myserver.com/share"}
      @db_opts =      {:dbname => 'vmdb_production', :username => 'root'}
      allow(MiqSmbSession).to receive(:runcmd)
      allow_any_instance_of(MiqSmbSession).to receive(:settings_mount_point).and_return(Rails.root.join("tmp"))
      allow(MiqUtil).to receive(:runcmd)
      allow(PostgresAdmin).to receive(:runcmd_with_logging)
      allow(FileUtils).to receive(:mv).and_return(true)
      allow(EvmDatabaseOps).to receive(:backup_destination_free_space).and_return(200.megabytes)
      allow(EvmDatabaseOps).to receive(:database_size).and_return(100.megabytes)
    end

    it "locally" 


    it "defaults" 


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
      allow_any_instance_of(MiqSmbSession).to receive(:settings_mount_point).and_return(Rails.root.join("tmp"))
      allow(PostgresAdmin).to receive(:runcmd_with_logging)
      allow(PostgresAdmin).to receive(:pg_dump_file?).and_return(true)
      allow(PostgresAdmin).to receive(:base_backup_file?).and_return(false)
    end

    it "from local backup" 


    it "from smb backup" 

  end
end

