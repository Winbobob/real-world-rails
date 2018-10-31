require 'spec_helper'

describe Gitlab::PagesClient do
  subject { described_class }

  describe '.token' do
    it 'returns the token as it is on disk' 

  end

  describe '.read_or_create_token' do
    subject { described_class.read_or_create_token }
    let(:token_path) { 'tmp/tests/gitlab-pages-secret' }
    before do
      allow(described_class).to receive(:token_path).and_return(token_path)
      FileUtils.rm_f(token_path)
    end

    it 'uses the existing token file if it exists' 


    it 'creates one if none exists' 

  end

  describe '.write_token' do
    let(:token_path) { 'tmp/tests/gitlab-pages-secret' }
    before do
      allow(described_class).to receive(:token_path).and_return(token_path)
      FileUtils.rm_f(token_path)
    end

    it 'writes the secret' 


    it 'does nothing if the file already exists' 

  end

  describe '.load_certificate' do
    subject { described_class.load_certificate }
    before do
      allow(described_class).to receive(:config).and_return(config)
    end

    context 'with no certificate in the config' do
      let(:config) { double(:config, certificate: '') }

      it 'does not set @certificate' 

    end

    context 'with a certificate path in the config' do
      let(:certificate_path) { 'tmp/tests/fake-certificate' }
      let(:config) { double(:config, certificate: certificate_path) }

      it 'sets @certificate' 

    end
  end

  describe '.request_kwargs' do
    let(:token) { 'secret token' }
    let(:auth_header) { 'Bearer c2VjcmV0IHRva2Vu' }
    before do
      allow(described_class).to receive(:token).and_return(token)
    end

    context 'without timeout' do
      it { expect(subject.send(:request_kwargs, nil)[:metadata]['authorization']).to eq(auth_header) }
    end

    context 'with timeout' do
      let(:timeout) { 1.second }

      it 'still sets the authorization header' 


      it 'sets a deadline value' 

    end
  end

  describe '.stub' do
    before do
      allow(described_class).to receive(:address).and_return('unix:/foo/bar')
    end

    it { expect(subject.send(:stub, :health_check)).to be_a(Grpc::Health::V1::Health::Stub) }
  end

  describe '.address' do
    subject { described_class.send(:address) }

    before do
      allow(described_class).to receive(:config).and_return(config)
    end

    context 'with a unix: address' do
      let(:config) { double(:config, address: 'unix:/foo/bar') }

      it { expect(subject).to eq('unix:/foo/bar') }
    end

    context 'with a tcp:// address' do
      let(:config) { double(:config, address: 'tcp://localhost:1234') }

      it { expect(subject).to eq('localhost:1234') }
    end
  end

  describe '.grpc_creds' do
    subject { described_class.send(:grpc_creds) }

    before do
      allow(described_class).to receive(:config).and_return(config)
    end

    context 'with a unix: address' do
      let(:config) { double(:config, address: 'unix:/foo/bar') }

      it { expect(subject).to eq(:this_channel_is_insecure) }
    end

    context 'with a tcp:// address' do
      let(:config) { double(:config, address: 'tcp://localhost:1234') }

      it { expect(subject).to be_a(GRPC::Core::ChannelCredentials) }
    end
  end
end

