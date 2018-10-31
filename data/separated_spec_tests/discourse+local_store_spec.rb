require 'rails_helper'
require 'file_store/local_store'

describe FileStore::LocalStore do

  let(:store) { FileStore::LocalStore.new }

  let(:upload) { Fabricate(:upload) }
  let(:uploaded_file) { file_from_fixtures("logo.png") }

  let(:optimized_image) { Fabricate(:optimized_image) }

  describe "#store_upload" do

    it "returns a relative url" 


  end

  describe "#store_optimized_image" do

    it "returns a relative url" 


  end

  describe "#remove_upload" do

    it "does not delete non uploaded" 


    it "moves the file to the tombstone" 


  end

  describe "#remove_optimized_image" do
    it "moves the file to the tombstone" 


  end

  describe "#has_been_uploaded?" do

    it "identifies relatives urls" 


    it "identifies local urls" 


    it "identifies local urls when using a CDN" 


    it "does not match dummy urls" 


  end

  def stub_for_subfolder
    GlobalSetting.stubs(:relative_url_root).returns('/forum')
    Discourse.stubs(:base_uri).returns("/forum")
  end

  describe "#absolute_base_url" do

    it "is present" 


    it "supports subfolder" 


  end

  describe "#relative_base_url" do

    it "is present" 


    it "supports subfolder" 


  end

  it "is internal" 


end

