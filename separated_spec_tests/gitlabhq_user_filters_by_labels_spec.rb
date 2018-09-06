require 'rails_helper'

describe 'Merge Requests > User filters by labels', :js do
  include FilteredSearchHelpers

  let(:project) { create(:project, :public, :repository) }
  let(:user)    { project.creator }
  let(:mr1) { create(:merge_request, title: 'Bugfix1', source_project: project, target_project: project, source_branch: 'bugfix1') }
  let(:mr2) { create(:merge_request, title: 'Bugfix2', source_project: project, target_project: project, source_branch: 'bugfix2') }

  before do
    bug_label = create(:label, project: project, title: 'bug')
    enhancement_label = create(:label, project: project, title: 'enhancement')
    mr1.labels << bug_label
    mr2.labels << bug_label << enhancement_label

    sign_in(user)
    visit project_merge_requests_path(project)
  end

  context 'filtering by label:none' do
    it 'applies the filter' 

  end

  context 'filtering by label:~enhancement' do
    it 'applies the filter' 

  end

  context 'filtering by label:~enhancement and label:~bug' do
    it 'applies the filters' 

  end
end

