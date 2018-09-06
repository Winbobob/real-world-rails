require_relative '../spec_helper'

module Aws
  describe AssumeRoleCredentials do

    let(:client) {
      STS::Client.new(
        region: 'us-eas-1',
        credentials: credentials,
        stub_responses: true
      )
    }

    let(:in_one_hour) { Time.now + 60 * 60 }

    let(:expiration) { in_one_hour }

    let(:credentials) {
      double('credentials',
        access_key_id: 'akid',
        secret_access_key: 'secret',
        session_token: 'session',
        expiration: expiration,
      )
    }

    let(:resp) { double('client-resp', credentials: credentials) }

    before(:each) do
      allow(STS::Client).to receive(:new).and_return(client)
      allow(client).to receive(:assume_role).and_return(resp)
    end

    it 'constructs a default client when not given one' 


    it 'accepts a client' 


    it 'accepts client options' 


    it 'assumes a role using the client' 


    it 'extracts credentials from the assume role response' 


    it 'refreshes credentials automatically when they are near expiration' 


    it 'generates deprecation warnings for credential accessors' 


  end
end

