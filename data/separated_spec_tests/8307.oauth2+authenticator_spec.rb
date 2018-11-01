RSpec.describe OAuth2::Authenticator do
  subject do
    described_class.new(client_id, client_secret, mode)
  end

  let(:client_id) { 'foo' }
  let(:client_secret) { 'bar' }
  let(:mode) { :undefined }

  it 'raises NotImplementedError for unknown authentication mode' 


  describe '#apply' do
    context 'with parameter-based authentication' do
      let(:mode) { :request_body }

      it 'adds client_id and client_secret to params' 


      it 'does not overwrite existing credentials' 


      it 'preserves other parameters' 

    end

    context 'with Basic authentication' do
      let(:mode) { :basic_auth }
      let(:header) { 'Basic ' + Base64.strict_encode64("#{client_id}:#{client_secret}") }

      it 'encodes credentials in headers' 


      it 'does not overwrite existing credentials' 


      it 'does not overwrite existing params or headers' 

    end
  end
end

