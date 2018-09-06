require 'rails_helper'

describe 'Merge Requests > User filters by assignees', :js do
  include FilteredSearchHelpers

  let(:project) { create(:project, :public, :repository) }
  let(:user)    { project.creator }

  before do
    create(:merge_request, assignee: user, title: 'Bugfix1', source_project: project, target_project: project, source_branch: 'bugfix1')
    create(:merge_request, title: 'Bugfix2', source_project: project, target_project: project, source_branch: 'bugfix2')

    sign_in(user)
    visit project_merge_requests_path(project)
  end

  context 'filtering by assignee:none' do
    it 'applies the filter' 

  end

  context 'filtering by assignee:@username' do
    it 'applies the filter' 

  end
end

