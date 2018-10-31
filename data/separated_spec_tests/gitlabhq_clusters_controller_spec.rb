require 'spec_helper'

describe Projects::ClustersController do
  include AccessMatchersForController
  include GoogleApi::CloudPlatformHelpers

  set(:project) { create(:project) }

  describe 'GET index' do
    describe 'functionality' do
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)
      end

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
            get :index, namespace_id: project.namespace, project_id: project, page: last_page
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
      it { expect { go }.to be_allowed_for(:master).of(project) }
      it { expect { go }.to be_denied_for(:developer).of(project) }
      it { expect { go }.to be_denied_for(:reporter).of(project) }
      it { expect { go }.to be_denied_for(:guest).of(project) }
      it { expect { go }.to be_denied_for(:user) }
      it { expect { go }.to be_denied_for(:external) }
    end

    def go
      get :index, namespace_id: project.namespace.to_param, project_id: project
    end
  end

  describe 'GET status' do
    let(:cluster) { create(:cluster, :providing_by_gcp, projects: [project]) }

    describe 'functionality' do
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)
      end

      it "responds with matching schema" 


      it 'invokes schedule_status_update on each application' 

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
      get :status, namespace_id: project.namespace,
                   project_id: project,
                   id: cluster,
                   format: :json
    end
  end

  describe 'GET show' do
    let(:cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }

    describe 'functionality' do
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)
      end

      it "renders view" 

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
      get :show, namespace_id: project.namespace,
                 project_id: project,
                 id: cluster
    end
  end

  describe 'PUT update' do
    context 'when cluster is provided by GCP' do
      let(:cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)
      end

      context 'when changing parameters' do
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


        it "does not change cluster name" 


        context 'when cluster is being created' do
          let(:cluster) { create(:cluster, :providing_by_gcp, projects: [project]) }

          it "rejects changes" 

        end
      end
    end

    context 'when cluster is provided by user' do
      let(:cluster) { create(:cluster, :provided_by_user, projects: [project]) }
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)
      end

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

      context 'when format is html' do
        context 'when update enabled' do
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
      end
    end

    describe 'security' do
      set(:cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }

      let(:params) do
        { cluster: { enabled: false } }
      end

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
      put :update, params.merge(namespace_id: project.namespace,
                                project_id: project,
                                id: cluster)
    end

    def go_json
      put :update, params.merge(namespace_id: project.namespace,
                                project_id: project,
                                id: cluster,
                                format: :json)
    end
  end

  describe 'DELETE destroy' do
    describe 'functionality' do
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)
      end

      context 'when cluster is provided by GCP' do
        context 'when cluster is created' do
          let!(:cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }

          it "destroys and redirects back to clusters list" 

        end

        context 'when cluster is being created' do
          let!(:cluster) { create(:cluster, :providing_by_gcp, projects: [project]) }

          it "destroys and redirects back to clusters list" 

        end
      end

      context 'when cluster is provided by user' do
        let!(:cluster) { create(:cluster, :provided_by_user, projects: [project]) }

        it "destroys and redirects back to clusters list" 

      end
    end

    describe 'security' do
      set(:cluster) { create(:cluster, :provided_by_gcp, projects: [project]) }

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
      delete :destroy, namespace_id: project.namespace,
                       project_id: project,
                       id: cluster
    end
  end
end

