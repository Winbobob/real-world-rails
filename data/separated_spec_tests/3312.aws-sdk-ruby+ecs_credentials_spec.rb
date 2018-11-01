require 'spec_helper'

module Aws
  describe ECSCredentials do

    let(:path) { '/latest/credentials?id=foobarbaz' }

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

    describe 'with ECS credential service present' do

      before(:each) do
        stub_const('ENV', {
          "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => path
        })
      end

      let(:expiration) { Time.now.utc + 3600 }
      let(:expiration2) { expiration + 3600 }

      let(:resp) { <<-JSON.strip }
{
  "RoleArn" : "arn:aws:iam::123456789012:role/BarFooRole",
  "AccessKeyId" : "akid",
  "SecretAccessKey" : "secret",
  "Token" : "session-token",
  "Expiration" : "#{expiration.strftime('%Y-%m-%dT%H:%M:%SZ')}"
}
      JSON

      let(:resp2) { <<-JSON.strip }
{
  "RoleArn" : "arn:aws:iam::123456789012:role/BarFooRole",
  "AccessKeyId" : "akid-2",
  "SecretAccessKey" : "secret-2",
  "Token" : "session-token-2",
  "Expiration" : "#{(expiration2).strftime('%Y-%m-%dT%H:%M:%SZ')}"
}
      JSON

      before(:each) do
        stub_request(:get, "http://169.254.170.2#{path}").
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

      before(:each) do
        stub_const('ENV', {
          "AWS_CONTAINER_CREDENTIALS_RELATIVE_URI" => path
        })
      end

      it 'defaults to 0' 


      it 'keeps trying "retries" times, with exponential backoff' 


    end
  end
end

