require 'feature_helper'

describe 'Tour' do
  context "when user hasn't finished the tour", js: true do
    let(:user) { create :user, :with_team, finished_tour: false }
    let!(:project) do
      create(:project, name: 'Test Project', users: [user], teams: [user.teams.first])
    end

    before do
      sign_in user
      visit_project_path
    end

    it 'steps through the whole tour cycle' 


    it 'skips the tour cycle' 

  end

  context 'when user has finished the tour', js: true do
    let(:user) { create :user, :with_team, finished_tour: false }
    let!(:project) do
      create(:project, name: 'Test Project', users: [user], teams: [user.teams.first])
    end

    before do
      sign_in user
      visit_project_path
    end

    it { expect(page).not_to have_content('Create Story') }
  end

  def visit_project_path
    visit project_path(project)
    wait_spinner
    wait_page_load
  end

  def tour_title
    find('.shepherd-step .shepherd-title')
  end

  def next_button
    find('.shepherd-step .shepherd-button', text: 'NEXT').click
  end

  def skip_button
    find('.shepherd-step .shepherd-button', text: 'SKIP').click
  end

  def finish_button
    find('.shepherd-step .shepherd-button', text: 'FINISH').click
  end
end

