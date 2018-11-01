require 'spec_helper'

describe Projects::LfsPointers::LfsDownloadLinkListService do
  let(:import_url) { 'http://www.gitlab.com/demo/repo.git' }
  let(:lfs_endpoint) { "#{import_url}/info/lfs/objects/batch" }
  let!(:project) { create(:project, import_url: import_url) }
  let(:new_oids) { { 'oid1' => 123, 'oid2' => 125 } }
  let(:remote_uri) { URI.parse(lfs_endpoint) }

  let(:objects_response) do
    body = new_oids.map do |oid, size|
      {
        'oid' => oid,
        'size' => size,
        'actions' => {
          'download' => { 'href' => "#{import_url}/gitlab-lfs/objects/#{oid}" }
        }
      }
    end

    Struct.new(:success?, :objects).new(true, body)
  end

  let(:invalid_object_response) do
    [
      'oid' => 'whatever',
      'size' => 123
    ]
  end

  subject { described_class.new(project, remote_uri: remote_uri) }

  before do
    allow(project).to receive(:lfs_enabled?).and_return(true)
    allow(Gitlab::HTTP).to receive(:post).and_return(objects_response)
  end

  describe '#execute' do
    it 'retrieves each download link of every non existent lfs object' 


    context 'credentials' do
      context 'when the download link and the lfs_endpoint have the same host' do
        context 'when lfs_endpoint has credentials' do
          let(:import_url) { 'http://user:password@www.gitlab.com/demo/repo.git' }

          it 'adds credentials to the download_link' 

        end

        context 'when lfs_endpoint does not have any credentials' do
          it 'does not add any credentials' 

        end
      end

      context 'when the download link and the lfs_endpoint have different hosts' do
        let(:import_url_with_credentials) { 'http://user:password@www.otherdomain.com/demo/repo.git' }
        let(:lfs_endpoint) { "#{import_url_with_credentials}/info/lfs/objects/batch" }

        it 'downloads without any credentials' 

      end
    end
  end

  describe '#get_download_links' do
    it 'raise errorif request fails' 

  end

  describe '#parse_response_links' do
    it 'does not add oid entry if href not found' 

  end
end

