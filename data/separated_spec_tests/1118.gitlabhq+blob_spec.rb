require 'spec_helper'

describe ContainerRegistry::Blob do
  let(:group) { create(:group, name: 'group') }
  let(:project) { create(:project, path: 'test', group: group) }

  let(:repository) do
    create(:container_repository, name: 'image',
                                  tags: %w[latest rc1],
                                  project: project)
  end

  let(:config) do
    { 'digest' => 'sha256:0123456789012345',
      'mediaType' => 'binary',
      'size' => 1000 }
  end

  let(:blob) { described_class.new(repository, config) }

  before do
    stub_container_registry_config(enabled: true,
                                   api_url: 'http://registry.gitlab',
                                   host_port: 'registry.gitlab')
  end

  it { expect(blob).to respond_to(:repository) }
  it { expect(blob).to delegate_method(:registry).to(:repository) }
  it { expect(blob).to delegate_method(:client).to(:repository) }

  describe '#path' do
    it 'returns a valid path to the blob' 

  end

  describe '#digest' do
    it 'return correct digest value' 

  end

  describe '#type' do
    it 'returns a correct type' 

  end

  describe '#revision' do
    it 'returns a correct blob SHA' 

  end

  describe '#short_revision' do
    it 'return a short SHA' 

  end

  describe '#delete' do
    before do
      stub_request(:delete, 'http://registry.gitlab/v2/group/test/image/blobs/sha256:0123456789012345')
        .to_return(status: 200)
    end

    it 'returns true when blob has been successfuly deleted' 

  end

  describe '#data' do
    context 'when locally stored' do
      before do
        stub_request(:get, 'http://registry.gitlab/v2/group/test/image/blobs/sha256:0123456789012345')
          .to_return(
            status: 200,
            headers: { 'Content-Type' => 'application/json' },
            body: '{"key":"value"}')
      end

      it 'returns a correct blob data' 

    end

    context 'when externally stored' do
      let(:location) { 'http://external.com/blob/file' }

      before do
        stub_request(:get, 'http://registry.gitlab/v2/group/test/image/blobs/sha256:0123456789012345')
          .with(headers: { 'Authorization' => 'bearer token' })
          .to_return(
            status: 307,
            headers: { 'Location' => location })
      end

      context 'for a valid address' do
        before do
          stub_request(:get, location)
            .with { |request| !request.headers.include?('Authorization') }
            .to_return(
              status: 200,
              headers: { 'Content-Type' => 'application/json' },
              body: '{"key":"value"}')
        end

        it 'returns correct data' 

      end

      context 'for invalid file' do
        let(:location) { 'file:///etc/passwd' }

        it 'raises an error' 

      end
    end
  end
end

