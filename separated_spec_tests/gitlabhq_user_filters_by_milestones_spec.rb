require 'rails_helper'

describe 'Merge Requests > User filters by milestones', :js do
  include FilteredSearchHelpers

  let(:project)   { create(:project, :public, :repository) }
  let(:user)      { project.creator }
  let(:milestone) { create(:milestone, project: project) }

  before do
    create(:merge_request, :with_diffs, source_project: project)
    create(:merge_request, :simple, source_project: project, milestone: milestone)

    sign_in(user)
    visit project_merge_requests_path(project)
  end

  it 'filters by no milestone' 


  it 'filters by a specific milestone' 


  describe 'filters by upcoming milestone' do
    it 'does not show merge requests with no expiry' 


    context 'with an upcoming milestone' do
      let(:milestone) { create(:milestone, project: project, due_date: Date.tomorrow) }

      it 'shows merge requests' 

    end

    context 'with a due milestone' do
      let(:milestone) { create(:milestone, project: project, due_date: Date.yesterday) }

      it 'does not show any merge requests' 

    end
  end
end

