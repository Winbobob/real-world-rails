require 'rails_helper'

# This test serves as a regression test for a bug that caused an error
# message to be shown by JavaScript when the source branch was deleted.
# Please do not remove ":js".
describe 'Merge request > User sees MR with deleted source branch', :js do
  let(:project) { create(:project, :public, :repository) }
  let(:merge_request) { create(:merge_request, source_project: project) }
  let(:user) { project.creator }

  before do
    merge_request.update!(source_branch: 'this-branch-does-not-exist')
    sign_in(user)
    visit project_merge_request_path(project, merge_request)
  end

  it 'shows a message about missing source branch' 


  it 'still contains Discussion, Commits and Changes tabs' 

end

