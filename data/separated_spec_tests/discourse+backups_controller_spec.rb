require 'rails_helper'

RSpec.describe Admin::BackupsController do
  let(:admin) { Fabricate(:admin) }
  let(:backup_filename) { "2014-02-10-065935.tar.gz" }
  let(:backup_filename2) { "2014-02-11-065935.tar.gz" }
  let(:store) { BackupRestore::LocalBackupStore.new }

  def create_backup_files(*filenames)
    @paths = filenames.map do |filename|
      path = backup_path(filename)
      File.open(path, "w") { |f| f.write("test backup") }
      path
    end
  end

  def backup_path(filename)
    File.join(BackupRestore::LocalBackupStore.base_directory, filename)
  end

  def map_preloaded
    controller.instance_variable_get("@preloaded").map do |key, value|
      [key, JSON.parse(value)]
    end.to_h
  end

  it "is a subclass of AdminController" 


  before do
    sign_in(admin)
    SiteSetting.backup_location = BackupLocationSiteSetting::LOCAL
  end

  after do
    $redis.flushall

    @paths&.each { |path| File.delete(path) if File.exists?(path) }
    @paths = nil
  end

  describe "#index" do
    it "raises an error when backups are disabled" 


    context "html format" do
      it "preloads important data" 

    end

    context "json format" do
      it "returns a list of all the backups" 

    end
  end

  describe '#status' do
    it "returns the current backups status" 

  end

  describe '#create' do
    it "starts a backup" 

  end

  describe '#show' do
    it "uses send_file to transmit the backup" 


    it "returns 422 when token is bad" 


    it "returns 404 when the backup does not exist" 

  end

  describe '#destroy' do
    it "removes the backup if found" 


    it "doesn't remove the backup if not found" 

  end

  describe '#logs' do
    it "preloads important data" 

  end

  describe '#restore' do
    it "starts a restore" 

  end

  describe '#readonly' do
    it "enables readonly mode" 


    it "disables readonly mode" 

  end

  describe "#upload_backup_chunk" do
    describe "when filename contains invalid characters" do
      it "should raise an error" 

    end

    describe "when filename is valid" do
      it "should upload the file successfully" 

    end
  end

  describe '#rollback' do
    it 'should rollback the restore' 


    it 'should not allow rollback via a GET request' 

  end

  describe '#cancel' do
    it "should cancel an backup" 


    it 'should not allow cancel via a GET request' 

  end

  describe "#email" do
    it "enqueues email job" 


    it "returns 404 when the backup does not exist" 

  end
end

