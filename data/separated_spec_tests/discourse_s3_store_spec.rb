require 'rails_helper'
require 'file_store/s3_store'
require 'file_store/local_store'

describe FileStore::S3Store do

  let(:store) { FileStore::S3Store.new }
  let(:s3_helper) { store.instance_variable_get(:@s3_helper) }
  let(:upload) { Fabricate(:upload) }
  let(:uploaded_file) { file_from_fixtures("logo.png") }

  let(:optimized_image) { Fabricate(:optimized_image) }
  let(:optimized_image_file) { file_from_fixtures("logo.png") }

  before(:each) do
    SiteSetting.s3_upload_bucket = "s3-upload-bucket"
    SiteSetting.s3_access_key_id = "s3-access-key-id"
    SiteSetting.s3_secret_access_key = "s3-secret-access-key"
    SiteSetting.enable_s3_uploads = true
  end

  shared_context 's3 helpers' do
    let(:upload) do
      Fabricate(:upload, sha1: Digest::SHA1.hexdigest('secreet image string'))
    end

    let(:store) { FileStore::S3Store.new }
    let(:client) { Aws::S3::Client.new(stub_responses: true) }
    let(:resource) { Aws::S3::Resource.new(client: client) }
    let(:s3_bucket) { resource.bucket("s3-upload-bucket") }
    let(:s3_helper) { store.instance_variable_get(:@s3_helper) }

    before do
      SiteSetting.s3_region = 'us-west-1'
    end
  end

  context 'uploading to s3' do
    include_context "s3 helpers"

    describe "#store_upload" do
      it "returns an absolute schemaless url" 


      describe "when s3_upload_bucket includes folders path" do
        before do
          SiteSetting.s3_upload_bucket = "s3-upload-bucket/discourse-uploads"
        end

        it "returns an absolute schemaless url" 

      end
    end

    describe "#store_optimized_image" do
      it "returns an absolute schemaless url" 


      describe "when s3_upload_bucket includes folders path" do
        before do
          SiteSetting.s3_upload_bucket = "s3-upload-bucket/discourse-uploads"
        end

        it "returns an absolute schemaless url" 

      end
    end
  end

  context 'removal from s3' do
    include_context "s3 helpers"

    describe "#remove_upload" do
      it "removes the file from s3 with the right paths" 


      describe "when s3_upload_bucket includes folders path" do
        before do
          SiteSetting.s3_upload_bucket = "s3-upload-bucket/discourse-uploads"
        end

        it "removes the file from s3 with the right paths" 

      end
    end

    describe "#remove_optimized_image" do
      let(:optimized_image) do
        Fabricate(:optimized_image,
          url: "//s3-upload-bucket.s3-us-west-1.amazonaws.com/optimized/1X/#{upload.sha1}_1_100x200.png",
          upload: upload
        )
      end

      it "removes the file from s3 with the right paths" 


      describe "when s3_upload_bucket includes folders path" do
        before do
          SiteSetting.s3_upload_bucket = "s3-upload-bucket/discourse-uploads"
        end

        it "removes the file from s3 with the right paths" 

      end
    end
  end

  describe ".has_been_uploaded?" do

    it "identifies S3 uploads" 


    it "does not match other s3 urls" 


  end

  describe ".absolute_base_url" do
    it "returns a lowercase schemaless absolute url" 


    it "uses the proper endpoint" 


  end

  it "is external" 


  describe ".purge_tombstone" do

    it "updates tombstone lifecycle" 


  end

  describe ".path_for" do

    def assert_path(path, expected)
      upload = Upload.new(url: path)

      path = store.path_for(upload)
      expected = FileStore::LocalStore.new.path_for(upload) if expected

      expect(path).to eq(expected)
    end

    it "correctly falls back to local" 

  end
end

