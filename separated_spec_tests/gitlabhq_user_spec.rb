require 'spec_helper'

feature 'User Cluster', :js do
  include GoogleApi::CloudPlatformHelpers

  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    gitlab_sign_in(user)
    allow(Projects::ClustersController).to receive(:STATUS_POLLING_INTERVAL) { 100 }
  end

  context 'when user does not have a cluster and visits cluster index page' do
    before do
      visit project_clusters_path(project)

      click_link 'Add Kubernetes cluster'
      click_link 'Add an existing Kubernetes cluster'
    end

    context 'when user filled form with valid parameters' do
      before do
        fill_in 'cluster_name', with: 'dev-cluster'
        fill_in 'cluster_platform_kubernetes_attributes_api_url', with: 'http://example.com'
        fill_in 'cluster_platform_kubernetes_attributes_token', with: 'my-token'
        click_button 'Add Kubernetes cluster'
      end

      it 'user sees a cluster details page' 

    end

    context 'when user filled form with invalid parameters' do
      before do
        click_button 'Add Kubernetes cluster'
      end

      it 'user sees a validation error' 

    end
  end

  context 'when user does have a cluster and visits cluster page' do
    let(:cluster) { create(:cluster, :provided_by_user, projects: [project]) }

    before do
      visit project_cluster_path(project, cluster)
    end

    it 'user sees a cluster details page' 


    context 'when user disables the cluster' do
      before do
        page.find(:css, '.js-cluster-enable-toggle-area .js-project-feature-toggle').click
        fill_in 'cluster_name', with: 'dev-cluster'
        page.within('#cluster-integration') { click_button 'Save changes' }
      end

      it 'user sees the successful message' 

    end

    context 'when user changes cluster parameters' do
      before do
        fill_in 'cluster_name', with: 'my-dev-cluster'
        fill_in 'cluster_platform_kubernetes_attributes_namespace', with: 'my-namespace'
        page.within('#js-cluster-details') { click_button 'Save changes' }
      end

      it 'user sees the successful message' 

    end

    context 'when user destroy the cluster' do
      before do
        page.accept_confirm do
          click_link 'Remove integration'
        end
      end

      it 'user sees creation form with the successful message' 

    end
  end
end

