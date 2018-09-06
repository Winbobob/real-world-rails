require 'spec_helper'

describe 'Projects > Settings > User manages merge request settings' do
  let(:user) { create(:user) }
  let(:project) { create(:project, :public, namespace: user.namespace, path: 'gitlab', name: 'sample') }

  before do
    sign_in(user)
    visit edit_project_path(project)
  end

  it 'shows "Merge commit" strategy' 


  it 'shows "Merge commit with semi-linear history " strategy' 


  it 'shows "Fast-forward merge" strategy' 


  context 'when Merge Request and Pipelines are initially enabled', :js do
    context 'when Pipelines are initially enabled' do
      it 'shows the Merge Requests settings' 

    end

    context 'when Pipelines are initially disabled', :js do
      before do
        project.project_feature.update_attribute('builds_access_level', ProjectFeature::DISABLED)
        visit edit_project_path(project)
      end

      it 'shows the Merge Requests settings that do not depend on Builds feature' 

    end
  end

  context 'when Merge Request are initially disabled', :js do
    before do
      project.project_feature.update_attribute('merge_requests_access_level', ProjectFeature::DISABLED)
      visit edit_project_path(project)
    end

    it 'does not show the Merge Requests settings' 

  end

  describe 'Checkbox to enable merge request link', :js do
    it 'is initially checked' 


    it 'when unchecked sets :printing_merge_request_link_enabled to false' 

  end
end

