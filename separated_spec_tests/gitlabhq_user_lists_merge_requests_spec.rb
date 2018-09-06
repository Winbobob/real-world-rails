require 'rails_helper'

describe 'Merge requests > User lists merge requests' do
  include MergeRequestHelpers
  include SortingHelper

  let(:project) { create(:project, :public, :repository) }
  let(:user) { create(:user) }

  before do
    @fix = create(:merge_request,
                  title: 'fix',
                  source_project: project,
                  source_branch: 'fix',
                  assignee: user,
                  milestone: create(:milestone, due_date: '2013-12-11'),
                  created_at: 1.minute.ago,
                  updated_at: 1.minute.ago)
    create(:merge_request,
           title: 'markdown',
           source_project: project,
           source_branch: 'markdown',
           assignee: user,
           milestone: create(:milestone, due_date: '2013-12-12'),
           created_at: 2.minutes.ago,
           updated_at: 2.minutes.ago)
    create(:merge_request,
           title: 'merge-test',
           source_project: project,
           source_branch: 'merge-test',
           created_at: 3.minutes.ago,
           updated_at: 10.seconds.ago)
  end

  it 'filters on no assignee' 


  it 'filters on a specific assignee' 


  it 'sorts by newest' 


  it 'sorts by last updated' 


  it 'sorts by milestone' 


  it 'filters on one label and sorts by due date' 


  context 'while filtering on two labels' do
    let(:label) { create(:label, project: project) }
    let(:label2) { create(:label, project: project) }

    before do
      create(:label_link, label: label, target: @fix)
      create(:label_link, label: label2, target: @fix)
    end

    it 'sorts by due date' 


    context 'filter on assignee and' do
      it 'sorts by due soon' 


      it 'sorts by recently due milestone' 

    end
  end

  def count_merge_requests
    page.all('ul.mr-list > li').count
  end
end

