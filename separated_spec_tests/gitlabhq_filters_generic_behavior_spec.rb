require 'rails_helper'

describe 'Merge Requests > Filters generic behavior', :js do
  include FilteredSearchHelpers

  let(:project) { create(:project, :public, :repository) }
  let(:user)    { project.creator }
  let(:bug) { create(:label, project: project, title: 'bug') }
  let(:open_mr) { create(:merge_request, title: 'Bugfix1', source_project: project, target_project: project, source_branch: 'bugfix1') }
  let(:merged_mr) { create(:merge_request, :merged, title: 'Bugfix2', source_project: project, target_project: project, source_branch: 'bugfix2') }
  let(:closed_mr) { create(:merge_request, :closed, title: 'Feature', source_project: project, target_project: project, source_branch: 'improve/awesome') }

  before do
    open_mr.labels << bug
    merged_mr.labels << bug
    closed_mr.labels << bug

    sign_in(user)
    visit project_merge_requests_path(project)
  end

  context 'when filtered by a label' do
    before do
      input_filtered_search('label:~bug')
    end

    describe 'state tabs' do
      it 'does not change when state tabs are clicked' 

    end

    describe 'clear button' do
      it 'allows user to remove filtered labels' 

    end
  end

  context 'filter dropdown' do
    it 'filters by label name' 

  end
end

