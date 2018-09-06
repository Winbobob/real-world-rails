require 'spec_helper'

describe HealthController do
  include StubENV

  let(:json_response) { JSON.parse(response.body) }
  let(:token) { Gitlab::CurrentSettings.health_check_access_token }
  let(:whitelisted_ip) { '127.0.0.1' }
  let(:not_whitelisted_ip) { '127.0.0.2' }

  before do
    allow(Settings.monitoring).to receive(:ip_whitelist).and_return([whitelisted_ip])
    stub_storage_settings({}) # Hide the broken storage
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
  end

  describe '#storage_check' do
    before do
      allow(Gitlab::RequestContext).to receive(:client_ip).and_return(whitelisted_ip)
    end

    subject { post :storage_check }

    it 'checks all the configured storages' 


    it 'returns the check interval' 


    context 'with failing storages', :broken_storage do
      before do
        stub_storage_settings(
          broken: { path: 'tmp/tests/non-existent-repositories' }
        )
      end

      it 'includes the failure information' 

    end
  end

  describe '#readiness' do
    shared_context 'endpoint responding with readiness data' do
      let(:request_params) { {} }

      subject { get :readiness, request_params }

      it 'responds with readiness checks data' 

    end

    context 'accessed from whitelisted ip' do
      before do
        allow(Gitlab::RequestContext).to receive(:client_ip).and_return(whitelisted_ip)
      end

      it_behaves_like 'endpoint responding with readiness data'
    end

    context 'accessed from not whitelisted ip' do
      before do
        allow(Gitlab::RequestContext).to receive(:client_ip).and_return(not_whitelisted_ip)
      end

      it 'responds with resource not found' 


      context 'accessed with valid token' do
        context 'token passed in request header' do
          before do
            request.headers['TOKEN'] = token
          end

          it_behaves_like 'endpoint responding with readiness data'
        end
      end

      context 'token passed as URL param' do
        it_behaves_like 'endpoint responding with readiness data' do
          let(:request_params) { { token: token } }
        end
      end
    end
  end

  describe '#liveness' do
    shared_context 'endpoint responding with liveness data' do
      subject { get :liveness }

      it 'responds with liveness checks data' 

    end

    context 'accessed from whitelisted ip' do
      before do
        allow(Gitlab::RequestContext).to receive(:client_ip).and_return(whitelisted_ip)
      end

      it_behaves_like 'endpoint responding with liveness data'
    end

    context 'accessed from not whitelisted ip' do
      before do
        allow(Gitlab::RequestContext).to receive(:client_ip).and_return(not_whitelisted_ip)
      end

      it 'responds with resource not found' 


      context 'accessed with valid token' do
        context 'token passed in request header' do
          before do
            request.headers['TOKEN'] = token
          end

          it_behaves_like 'endpoint responding with liveness data'
        end

        context 'token passed as URL param' do
          it_behaves_like 'endpoint responding with liveness data' do
            subject { get :liveness, token: token }
          end
        end
      end
    end
  end
end

