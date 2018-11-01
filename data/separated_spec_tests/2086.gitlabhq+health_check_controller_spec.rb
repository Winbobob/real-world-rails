require 'spec_helper'

describe HealthCheckController do
  include StubENV

  let(:json_response) { JSON.parse(response.body) }
  let(:xml_response) { Hash.from_xml(response.body)['hash'] }
  let(:token) { Gitlab::CurrentSettings.health_check_access_token }
  let(:whitelisted_ip) { '127.0.0.1' }
  let(:not_whitelisted_ip) { '127.0.0.2' }

  before do
    allow(Settings.monitoring).to receive(:ip_whitelist).and_return([whitelisted_ip])
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
  end

  describe 'GET #index' do
    context 'when services are up but accessed from outside whitelisted ips' do
      before do
        allow(Gitlab::RequestContext).to receive(:client_ip).and_return(not_whitelisted_ip)
      end

      it 'returns a not found page' 


      context 'when services are accessed with token' do
        it 'supports passing the token in the header' 


        it 'supports passing the token in query params' 

      end
    end

    context 'when services are up and accessed from whitelisted ips' do
      before do
        allow(Gitlab::RequestContext).to receive(:client_ip).and_return(whitelisted_ip)
      end

      it 'supports successful plaintext response' 


      it 'supports successful json response' 


      it 'supports successful xml response' 


      it 'supports successful responses for specific checks' 

    end

    context 'when a service is down but NO access token' do
      it 'returns a not found page' 

    end

    context 'when a service is down and an endpoint is accessed from whitelisted ip' do
      before do
        allow(HealthCheck::Utils).to receive(:process_checks).with(['standard']).and_return('The server is on fire')
        allow(HealthCheck::Utils).to receive(:process_checks).with(['email']).and_return('Email is on fire')
        allow(Gitlab::RequestContext).to receive(:client_ip).and_return(whitelisted_ip)
      end

      it 'supports failure plaintext response' 


      it 'supports failure json response' 


      it 'supports failure xml response' 


      it 'supports failure responses for specific checks' 

    end
  end
end

