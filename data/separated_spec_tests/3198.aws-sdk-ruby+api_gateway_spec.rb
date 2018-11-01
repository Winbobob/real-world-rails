require_relative '../../spec_helper'

describe 'Client Interface:' do
  describe 'API Gateway white label SDK' do

    before(:all) do
       SpecHelper.generate_service(['WhiteLabel'], multiple_files: false, custom: true)
    end

    let(:creds) {
      Aws::Credentials.new('akid', 'secret')
    }
    let(:client) {
      WhiteLabel::Client.new(
        stub_responses: true,
      )
    }
    let(:client_w_token) {
      WhiteLabel::Client.new(
        stub_responses: true,
        authorizer_token: 'my-fancy-token'
      )
    }
    let(:client_w_token_creds) {
      WhiteLabel::Client.new(
        stub_responses: true,
        credentials: creds,
        authorizer_token: 'my-fancy-token'
      )
    }

    it 'allows empty operation clients' 


    it 'detects invalid shape_ref' 


    it 'populates x-api-key header correctly' 


    it 'add user-agent when not provided' 


    it 'allows customized authorizer token' 


    it 'use custom authorizer with `custom` authtype only' 


  end
end

