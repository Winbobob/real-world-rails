require 'rails_helper'
require 'health_check'

RSpec.describe HealthCheck do
  describe '.checkup' do
    let(:env) { {} }
    subject { HealthCheck.checkup(env) }

    before do
      Site.reload
    end

    it 'includes the hostname' 


    it "includes the url of the client request (as provided by the REQUEST_URI)" 


    it 'warns if no REQUEST_URI is present from which to fetch the url of the client request' 


    it 'includes the ip of the client request (as provided by the REMOTE_ADDR)' 


    it 'warns if no REMOTE_ADDR is present from which to fetch the ip of the client request' 


    it 'includes the local time on the server in the timezone and as utc' 


    describe "includes database connection status" do
      it "is normally ok" 


      it "detects failure" 

    end

    describe "includes database persistence status" do
      it "is normally ok" 


      it "detects failure to read records" 


      it "detects failure to write records" 

    end

    describe 'includes database integrity status' do
      it "is ok when we are fully migrated" 


      it "detects when we are missing some migrations" 

    end
  end
end

