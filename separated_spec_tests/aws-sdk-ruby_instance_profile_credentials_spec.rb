require_relative '../spec_helper'

module Aws
  describe InstanceProfileCredentials do

    let(:path) { '/latest/meta-data/iam/security-credentials/' }

    describe 'without instance metadata service present' do

      [
        Errno::EHOSTUNREACH,
        Errno::ECONNREFUSED,
        SocketError,
        Timeout::Error,
      ].each do |error_class|
        it "returns no credentials for #{error_class}" 

      end

    end

    describe 'disable flag' do
      let(:env) {{}}

      before(:each) do
        stub_const('ENV', env)
      end

      it 'does not attempt to get credentials when disable flag set' 


      it 'has a disable flag which is not case sensitive' 


      it 'ignores values other than true for the disable flag' 

    end

    describe 'with instance metadata service present' do

      let(:expiration) { Time.now.utc + 3600 }
      let(:expiration2) { expiration + 3600 }

      let(:resp) { <<-JSON.strip }
{
  "Code" : "Success",
  "LastUpdated" : "2013-11-22T20:03:48Z",
  "Type" : "AWS-HMAC",
  "AccessKeyId" : "akid",
  "SecretAccessKey" : "secret",
  "Token" : "session-token",
  "Expiration" : "#{expiration.strftime('%Y-%m-%dT%H:%M:%SZ')}"
}
      JSON

      let(:resp2) { <<-JSON.strip }
{
  "Code" : "Success",
  "LastUpdated" : "2013-11-22T20:03:48Z",
  "Type" : "AWS-HMAC",
  "AccessKeyId" : "akid-2",
  "SecretAccessKey" : "secret-2",
  "Token" : "session-token-2",
  "Expiration" : "#{(expiration2).strftime('%Y-%m-%dT%H:%M:%SZ')}"
}
      JSON

      before(:each) do
        stub_request(:get, "http://169.254.169.254#{path}").
          to_return(:status => 200, :body => "profile-name\n")
        stub_request(:get, "http://169.254.169.254#{path}profile-name").
          to_return(:status => 200, :body => resp).
          to_return(:status => 200, :body => resp2)
      end

      it 'populates credentials from the instance profile' 


      it 're-queries the metadata service when #refresh! is called' 


      it 'retries if the first load fails' 


      it 'retries if get profile response is invalid JSON' 


      it 'retries invalid JSON exactly 3 times' 


      it 'retries errors parsing expiration time 3 times' 


      describe 'auto refreshing' do

        # expire in 4 minutes
        let(:expiration) { Time.now.utc + 299 }

        it 'auto-refreshes within 5 minutes from expiration' 


      end

      describe 'failure cases' do

        let(:resp) { '{}' }

        it 'given an empty response, entry credentials are returned' 


      end

    end

    describe '#retries' do

      it 'defaults to 0' 


      it 'keeps trying "retries" times, with exponential backoff' 


    end
  end
end

