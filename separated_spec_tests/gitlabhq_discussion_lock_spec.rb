require 'spec_helper'

describe 'Discussion Lock', :js do
  let(:user) { create(:user) }
  let(:issue) { create(:issue, project: project, author: user) }
  let(:project) { create(:project, :public) }

  before do
    sign_in(user)
  end

  context 'when a user is a team member' do
    before do
      project.add_developer(user)
    end

    context 'when the discussion is unlocked' do
      it 'the user can lock the issue' 

    end

    context 'when the discussion is locked' do
      before do
        issue.update_attribute(:discussion_locked, true)
        visit project_issue_path(project, issue)
      end

      it 'the user can unlock the issue' 


      it 'the user can create a comment' 

    end
  end

  context 'when a user is not a team member' do
    context 'when the discussion is unlocked' do
      before do
        visit project_issue_path(project, issue)
      end

      it 'the user can not lock the issue' 


      it 'the user can create a comment' 

    end

    context 'when the discussion is locked' do
      before do
        issue.update_attribute(:discussion_locked, true)
        visit project_issue_path(project, issue)
      end

      it 'the user can not unlock the issue' 


      it 'the user can not create a comment' 

    end
  end
end

