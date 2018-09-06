require 'rails_helper'

describe 'Merge request > User awards emoji', :js do
  let(:project) { create(:project, :public, :repository) }
  let(:user) { project.creator }
  let(:merge_request) { create(:merge_request, source_project: project, author: create(:user)) }

  describe 'logged in' do
    before do
      sign_in(user)
      visit project_merge_request_path(project, merge_request)
    end

    it 'adds award to merge request' 


    it 'removes award from merge request' 


    it 'has only one menu on the page' 


    describe 'the project is archived' do
      let(:project) { create(:project, :public, :repository, :archived) }

      it 'does not see award menu button' 

    end
  end

  describe 'logged out' do
    before do
      visit project_merge_request_path(project, merge_request)
    end

    it 'does not see award menu button' 

  end
end

