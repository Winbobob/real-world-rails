require 'spec_helper'

feature 'Clusters', :js do
  include GoogleApi::CloudPlatformHelpers

  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    gitlab_sign_in(user)
  end

  context 'when user does not have a cluster and visits cluster index page' do
    before do
      visit project_clusters_path(project)
    end

    it 'sees empty state' 

  end

  context 'when user has a cluster and visits cluster index page' do
    let!(:cluster) { create(:cluster, :project, :provided_by_gcp) }
    let(:project) { cluster.project }

    before do
      visit project_clusters_path(project)
    end

    it 'user sees a table with one cluster' 


    context 'inline update of cluster' do
      it 'user can update cluster' 


      context 'with sucessfull request' do
        it 'user sees updated cluster' 

      end

      context 'with failed request' do
        it 'user sees not update cluster and error message' 

      end
    end

    context 'when user clicks on a cluster' do
      before do
        click_link cluster.name
      end

      it 'user sees a cluster details page' 

    end
  end

  context 'when user has not signed in Google' do
    before do
      visit project_clusters_path(project)

      click_link 'Add Kubernetes cluster'
      click_link 'Create on Google Kubernetes Engine'
    end

    it 'user sees a login page' 

  end
end

