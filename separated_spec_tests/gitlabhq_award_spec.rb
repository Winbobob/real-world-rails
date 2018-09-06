require 'rails_helper'

feature 'Issue awards', :js do
  let(:user)      { create(:user) }
  let(:project)   { create(:project, :public) }
  let(:issue)     { create(:issue, project: project) }

  describe 'logged in' do
    before do
      sign_in(user)
      visit project_issue_path(project, issue)
      wait_for_requests
    end

    it 'adds award to issue' 


    it 'removes award from issue' 


    it 'only has one menu on the page' 

  end

  describe 'logged out' do
    before do
      visit project_issue_path(project, issue)
      wait_for_requests
    end

    it 'does not see award menu button' 

  end
end

