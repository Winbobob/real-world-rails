require 'rails_helper'

describe 'Merge request > User locks discussion', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, :public, :repository) }
  let(:merge_request) { create(:merge_request, source_project: project) }

  before do
    sign_in(user)
  end

  context 'when the discussion is locked' do
    before do
      merge_request.update_attribute(:discussion_locked, true)
    end

    context 'when a user is a team member' do
      before do
        project.add_developer(user)
        visit project_merge_request_path(project, merge_request)
      end

      it 'the user can create a comment' 

    end

    context 'when a user is not a team member' do
      before do
        visit project_merge_request_path(project, merge_request)
      end

      it 'the user can not create a comment' 

    end
  end
end

