require 'rails_helper'

describe 'Merge requests > User filters by multiple criteria', :js do
  include FilteredSearchHelpers

  let!(:project)   { create(:project, :public, :repository) }
  let(:user)       { project.creator }
  let!(:milestone) { create(:milestone, title: 'v1.1', project: project) }
  let!(:wontfix)   { create(:label, project: project, title: "Won't fix") }

  before do
    sign_in(user)
    mr = create(:merge_request, title: 'Bugfix2', author: user, assignee: user, source_project: project, target_project: project, milestone: milestone)
    mr.labels << wontfix

    visit project_merge_requests_path(project)
  end

  describe 'filtering by label:~"Won\'t fix" and assignee:~bug' do
    it 'applies the filters' 

  end

  describe 'filtering by text, author, assignee, milestone, and label' do
    it 'filters by text, author, assignee, milestone, and label' 

  end
end

