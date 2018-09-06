# frozen_string_literal: true

RSpec.describe RuboCop::RemoteConfig do
  include FileHelper

  subject(:remote_config) do
    described_class.new(remote_config_url, base_dir).file
  end

  let(:remote_config_url) { 'http://example.com/rubocop.yml' }
  let(:base_dir) { '.' }
  let(:cached_file_name) { '.rubocop-http---example-com-rubocop-yml' }
  let(:cached_file_path) { File.expand_path(cached_file_name, base_dir) }

  before do
    stub_request(:get, remote_config_url)
      .to_return(status: 200, body: "Style/Encoding:\n    Enabled: true")
  end

  after do
    File.unlink cached_file_path if File.exist? cached_file_path
  end

  describe '.file' do
    it 'downloads the file if the file does not exist' 


    it 'does not download the file if cache lifetime has not been reached' 


    it 'downloads the file if cache lifetime has been reached' 


    context 'when the remote URL responds with redirect' do
      let(:new_location) { 'http://cdn.example.com/rubocop.yml' }

      before do
        stub_request(:get, remote_config_url)
          .to_return(headers: { 'Location' => new_location })

        stub_request(:get, new_location)
          .to_return(status: 200, body: "Style/Encoding:\n    Enabled: true")
      end

      it 'follows the redirect and downloads the file' 

    end

    context 'when the remote URL responds with not modified' do
      before do
        stub_request(:get, remote_config_url)
          .to_return(status: 304)
      end

      it 'reuses the existing cached file' 

    end

    context 'when the network is inaccessible' do
      before do
        stub_request(:get, remote_config_url)
          .to_raise(SocketError)
      end

      it 'reuses the existing cached file' 

    end

    context 'when the remote URL responds with 500' do
      before do
        stub_request(:get, remote_config_url)
          .to_return(status: 500)
      end

      it 'raises error' 

    end
  end
end

