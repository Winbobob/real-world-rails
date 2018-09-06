require 'spec_helper'

describe Projects::Clusters::GcpController do
  include AccessMatchersForController
  include GoogleApi::CloudPlatformHelpers

  set(:project) { create(:project) }

  describe 'GET login' do
    describe 'functionality' do
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)
      end

      context 'when omniauth has been configured' do
        let(:key) { 'secret-key' }
        let(:session_key_for_redirect_uri) do
          GoogleApi::CloudPlatform::Client.session_key_for_redirect_uri(key)
        end

        before do
          allow(SecureRandom).to receive(:hex).and_return(key)
        end

        it 'has authorize_url' 

      end

      context 'when omniauth has not configured' do
        before do
          stub_omniauth_setting(providers: [])
        end

        it 'does not have authorize_url' 

      end
    end

    describe 'security' do
      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:master).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end

    def go
      get :login, namespace_id: project.namespace, project_id: project
    end
  end

  describe 'GET new' do
    describe 'functionality' do
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)
      end

      context 'when access token is valid' do
        before do
          stub_google_api_validate_token
        end

        it 'has new object' 

      end

      context 'when access token is expired' do
        before do
          stub_google_api_expired_token
        end

        it { expect(go).to redirect_to(gcp_login_project_clusters_path(project)) }
      end

      context 'when access token is not stored in session' do
        it { expect(go).to redirect_to(gcp_login_project_clusters_path(project)) }
      end
    end

    describe 'security' do
      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:master).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end

    def go
      get :new, namespace_id: project.namespace, project_id: project
    end
  end

  describe 'POST create' do
    let(:params) do
      {
        cluster: {
          name: 'new-cluster',
          provider_gcp_attributes: {
            gcp_project_id: '111'
          }
        }
      }
    end

    describe 'functionality' do
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)
      end

      context 'when access token is valid' do
        before do
          stub_google_api_validate_token
          allow_any_instance_of(described_class).to receive(:authorize_google_project_billing)
        end

        context 'when google project billing is enabled' do
          before do
            redis_double = double.as_null_object
            allow(Gitlab::Redis::SharedState).to receive(:with).and_yield(redis_double)
            allow(redis_double).to receive(:get).with(CheckGcpProjectBillingWorker.redis_shared_state_key_for('token')).and_return('true')
          end

          it 'creates a new cluster' 

        end

        context 'when google project billing is not enabled' do
          it 'renders the cluster form with an error' 

        end
      end

      context 'when access token is expired' do
        before do
          stub_google_api_expired_token
        end

        it 'redirects to login page' 

      end

      context 'when access token is not stored in session' do
        it 'redirects to login page' 

      end
    end

    describe 'security' do
      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:master).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end

    def go
      post :create, params.merge(namespace_id: project.namespace, project_id: project)
    end
  end
end
