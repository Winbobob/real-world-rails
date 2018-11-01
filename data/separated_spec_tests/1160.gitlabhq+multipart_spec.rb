require 'spec_helper'

require 'tempfile'

describe Gitlab::Middleware::Multipart do
  let(:app) { double(:app) }
  let(:middleware) { described_class.new(app) }
  let(:original_filename) { 'filename' }

  shared_examples_for 'multipart upload files' do
    it 'opens top-level files' 


    it 'opens files one level deep' 


    it 'opens files two levels deep' 


    def expect_uploaded_file(tempfile, path, remote: false)
      expect(app).to receive(:call) do |env|
        file = Rack::Request.new(env).params.dig(*path)
        expect(file).to be_a(::UploadedFile)
        expect(file.path).to eq(tempfile.path)
        expect(file.original_filename).to eq(original_filename)
        expect(file.remote_id).to eq(remote_id)
      end
    end
  end

  it 'rejects headers signed with the wrong secret' 


  it 'rejects headers signed with the wrong issuer' 


  context 'with remote file' do
    let(:remote_id) { 'someid' }

    it_behaves_like 'multipart upload files'
  end

  context 'with local file' do
    let(:remote_id) { nil }

    it_behaves_like 'multipart upload files'
  end

  it 'allows files in uploads/tmp directory' 


  it 'allows symlinks for uploads dir' 


  def post_env(rewritten_fields, params, secret, issuer)
    token = JWT.encode({ 'iss' => issuer, 'rewritten_fields' => rewritten_fields }, secret, 'HS256')
    Rack::MockRequest.env_for(
      '/',
      method: 'post',
      params: params,
      described_class::RACK_ENV_KEY => token
    )
  end
end

