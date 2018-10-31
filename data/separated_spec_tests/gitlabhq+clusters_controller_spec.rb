require 'spec_helper'

describe Projects::ClustersController do
  include AccessMatchersForController
  include GoogleApi::CloudPlatformHelpers

  set(:project) { create(:project) }

  let(:user) { create(:user) }

  before do
    project.add_maintainer(user)
    sign_in(user)
  end

  describe 'GET index' do
    def go(params = {})
      get :index, params.reverse_merge(namespace_id: project.namespace.to_param, project_id: project)
    end

    describe 'functionality' do
      context 'when project has one or more clusters' do
        let(:project) { create(:project) }
        let!(:enabled_cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }
        let!(:disabled_cluster) { create(:cluster, :disabled, :provided_by_gcp, :production_environment, projects: [project]) }
        it 'lists available clusters' 


        context 'when page is specified' do
          let(:last_page) { project.clusters.page.total_pages }

          before do
            allow(Clusters::Cluster).to receive(:paginates_per).and_return(1)
            create_list(:cluster, 2, :provided_by_gcp, :production_environment, projects: [project])
          end

          it 'redirects to the page' 

        end
      end

      context 'when project does not have a cluster' do
        let(:project) { create(:project) }

        it 'returns an empty state page' 

      end
    end

    describe 'security' do
      let(:cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }

      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:maintainer).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end
  end

  describe 'GET new' do
    def go
      get :new, namespace_id: project.namespace, project_id: project
    end

    describe 'functionality for new cluster' do
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

        it { expect(@valid_gcp_token).to be_falsey }
      end

      context 'when access token is not stored in session' do
        it { expect(@valid_gcp_token).to be_falsey }
      end
    end

    describe 'functionality for existing cluster' do
      it 'has new object' 

    end

    describe 'security' do
      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:maintainer).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end
  end

  describe 'POST create for new cluster' do
    let(:legacy_abac_param) { 'true' }
    let(:params) do
      {
        cluster: {
          name: 'new-cluster',
          provider_gcp_attributes: {
            gcp_project_id: 'gcp-project-12345',
            legacy_abac: legacy_abac_param
          }
        }
      }
    end

    def go
      post :create_gcp, params.merge(namespace_id: project.namespace, project_id: project)
    end

    describe 'functionality' do
      context 'when access token is valid' do
        before do
          stub_google_api_validate_token
        end

        it 'creates a new cluster' 


        context 'when legacy_abac param is false' do
          let(:legacy_abac_param) { 'false' }

          it 'creates a new cluster with legacy_abac_disabled' 

        end
      end

      context 'when access token is expired' do
        before do
          stub_google_api_expired_token
        end

        it { expect(@valid_gcp_token).to be_falsey }
      end

      context 'when access token is not stored in session' do
        it { expect(@valid_gcp_token).to be_falsey }
      end
    end

    describe 'security' do
      before do
        allow_any_instance_of(described_class)
        .to receive(:token_in_session).and_return('token')
        allow_any_instance_of(described_class)
        .to receive(:expires_at_in_session).and_return(1.hour.since.to_i.to_s)
        allow_any_instance_of(GoogleApi::CloudPlatform::Client)
          .to receive(:projects_zones_clusters_create) do
          OpenStruct.new(
            self_link: 'projects/gcp-project-12345/zones/us-central1-a/operations/ope-123',
            status: 'RUNNING'
          )
        end

        allow(WaitForClusterCreationWorker).to receive(:perform_in).and_return(nil)
      end

      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:maintainer).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end
  end

  describe 'POST create for existing cluster' do
    let(:params) do
      {
        cluster: {
          name: 'new-cluster',
          platform_kubernetes_attributes: {
            api_url: 'http://my-url',
            token: 'test',
            namespace: 'aaa'
          }
        }
      }
    end

    def go
      post :create_user, params.merge(namespace_id: project.namespace, project_id: project)
    end

    describe 'functionality' do
      context 'when creates a cluster' do
        it 'creates a new cluster' 

      end

      context 'when creates a RBAC-enabled cluster' do
        let(:params) do
          {
            cluster: {
              name: 'new-cluster',
              platform_kubernetes_attributes: {
                api_url: 'http://my-url',
                token: 'test',
                namespace: 'aaa',
                authorization_type: 'rbac'
              }
            }
          }
        end

        it 'creates a new cluster' 

      end
    end

    describe 'security' do
      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:maintainer).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end
  end

  describe 'GET status' do
    let(:cluster) { create(:cluster, :providing_by_gcp, projects: [project]) }

    def go
      get :status, namespace_id: project.namespace,
                   project_id: project,
                   id: cluster,
                   format: :json
    end

    describe 'functionality' do
      it "responds with matching schema" 


      it 'invokes schedule_status_update on each application' 

    end

    describe 'security' do
      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:maintainer).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end
  end

  describe 'GET show' do
    let(:cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }

    def go
      get :show, namespace_id: project.namespace,
                 project_id: project,
                 id: cluster
    end

    describe 'functionality' do
      it "renders view" 

    end

    describe 'security' do
      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:maintainer).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end
  end

  describe 'PUT update' do
    let(:cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }

    let(:params) do
      {
        cluster: {
          enabled: false,
          name: 'my-new-cluster-name',
          platform_kubernetes_attributes: {
            namespace: 'my-namespace'
          }
        }
      }
    end

    def go(format: :html)
      put :update, params.merge(namespace_id: project.namespace,
                                project_id: project,
                                id: cluster,
                                format: format
                               )
    end

    context 'when cluster is provided by GCP' do
      it "updates and redirects back to show page" 


      it "does not change cluster name" 


      context 'when cluster is being created' do
        let(:cluster) { create(:cluster, :providing_by_gcp, projects: [project]) }

        it "rejects changes" 

      end
    end

    context 'when cluster is provided by user' do
      let(:cluster) { create(:cluster, :provided_by_user, projects: [project]) }

      let(:params) do
        {
          cluster: {
            enabled: false,
            name: 'my-new-cluster-name',
            platform_kubernetes_attributes: {
              namespace: 'my-namespace'
            }
          }
        }
      end

      it "updates and redirects back to show page" 


      context 'when format is json' do
        context 'when changing parameters' do
          context 'when valid parameters are used' do
            let(:params) do
              {
                cluster: {
                  enabled: false,
                  name: 'my-new-cluster-name',
                  platform_kubernetes_attributes: {
                    namespace: 'my-namespace'
                  }
                }
              }
            end

            it "updates and redirects back to show page" 

          end

          context 'when invalid parameters are used' do
            let(:params) do
              {
                cluster: {
                  enabled: false,
                  platform_kubernetes_attributes: {
                    namespace: 'my invalid namespace #@'
                  }
                }
              }
            end

            it "rejects changes" 

          end
        end
      end
    end

    describe 'security' do
      set(:cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }

      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:maintainer).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end
  end

  describe 'DELETE destroy' do
    let!(:cluster) { create(:cluster, :provided_by_gcp, :production_environment, projects: [project]) }

    def go
      delete :destroy, namespace_id: project.namespace,
                       project_id: project,
                       id: cluster
    end

    describe 'functionality' do
      context 'when cluster is provided by GCP' do
        context 'when cluster is created' do
          it "destroys and redirects back to clusters list" 

        end

        context 'when cluster is being created' do
          let!(:cluster) { create(:cluster, :providing_by_gcp, :production_environment, projects: [project]) }

          it "destroys and redirects back to clusters list" 

        end
      end

      context 'when cluster is provided by user' do
        let!(:cluster) { create(:cluster, :provided_by_user, :production_environment, projects: [project]) }

        it "destroys and redirects back to clusters list" 

      end
    end

    describe 'security' do
      set(:cluster) { create(:cluster, :provided_by_gcp, :production_environment, projects: [project]) }

      it { expect { go }.to be_allowed_for(:admin) }
      it { expect { go }.to be_allowed_for(:owner).of(project) }
      it { expect { go }.to be_allowed_for(:maintainer).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end
  end
end

