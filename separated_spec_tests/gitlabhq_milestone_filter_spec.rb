require 'spec_helper'

feature 'Dashboard > milestone filter', :js do
  include FilterItemSelectHelper

  let(:user) { create(:user) }
  let(:project) { create(:project, name: 'test', namespace: user.namespace) }
  let(:milestone) { create(:milestone, title: 'v1.0', project: project) }
  let(:milestone2) { create(:milestone, title: 'v2.0', project: project) }
  let!(:issue) { create :issue, author: user, project: project, milestone: milestone }
  let!(:issue2) { create :issue, author: user, project: project, milestone: milestone2 }

  dropdown_toggle_button = '.js-milestone-select'

  before do
    sign_in(user)
  end

  context 'default state' do
    it 'shows issues with Any Milestone' 

  end

  context 'filtering by milestone' do
    before do
      visit issues_dashboard_path(author_id: user.id)
      filter_item_select('v1.0', dropdown_toggle_button)
      find(dropdown_toggle_button).click
      wait_for_requests
    end

    it 'shows issues with Milestone v1.0' 


    it 'should not change active Milestone unless clicked' 

  end

  context 'with milestone filter in URL' do
    before do
      visit issues_dashboard_path(author_id: user.id, milestone_title: milestone.title)
      find(dropdown_toggle_button).click
      wait_for_requests
    end

    it 'has milestone selected' 


    it 'removes milestone filter from URL after clicking "Any Milestone"' 

  end
end

