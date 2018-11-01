require 'spec_helper_min'
require 'tempfile'
require 'helpers/subdomainless_helper'

describe Carto::StorageOptions::Local do
  # Just here to allow subdomainless helpers to work
  def host!(_) end

  shared_examples_for 'upload' do
    before(:all) do
      @prefix = unique_name('prefix')
      @storage = Carto::StorageOptions::Local.new(@prefix)
      @storage.stubs(:public_uploaded_assets_path).returns(upload_path)

      @file = Tempfile.new('test')
      @file.write('wadus')
      @file.close

      @path, @url = @storage.upload('123', @file)
    end

    it 'uploads a file' 


    it 'deletes source file' 


    it 'url starts with domain/uploads/' 


    it 'url should not contain filesystem paths' 

  end

  shared_examples_for 'upload paths' do
    describe 'with default path' do
      let(:upload_path) { 'public/uploads' }

      it_behaves_like 'upload'
    end

    describe 'with custom path' do
      let(:upload_path) { '/tmp/carto_uploads' }

      it_behaves_like 'upload'
    end
  end

  describe 'domainful' do
    before(:each) do
      stub_domainful('org')
    end

    it_behaves_like 'upload paths'
  end

  describe 'subdomainless' do
    before(:each) do
      stub_subdomainless
    end

    it_behaves_like 'upload paths'
  end
end

