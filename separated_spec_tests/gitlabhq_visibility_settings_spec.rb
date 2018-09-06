require 'spec_helper'

describe 'Projects > Settings > Visibility settings', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, namespace: user.namespace, visibility_level: 20) }

  context 'as owner' do
    before do
      sign_in(user)
      visit edit_project_path(project)
    end

    it 'project visibility select is available' 


    it 'project visibility description updates on change' 


    context 'merge requests select' do
      it 'hides merge requests section' 


      context 'given project with merge_requests_disabled access level' do
        let(:project) { create(:project, :merge_requests_disabled, namespace: user.namespace) }

        it 'hides merge requests section' 

      end
    end

    context 'builds select' do
      it 'hides builds select section' 


      context 'given project with builds_disabled access level' do
        let(:project) { create(:project, :builds_disabled, namespace: user.namespace) }

        it 'hides builds select section' 

      end
    end
  end

  context 'as master' do
    let(:master_user) { create(:user) }

    before do
      project.add_master(master_user)
      sign_in(master_user)
      visit edit_project_path(project)
    end

    it 'project visibility is locked' 

  end
end

