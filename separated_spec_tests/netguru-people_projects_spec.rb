require 'spec_helper'

describe 'Projects dashboard page', js: true do
  let!(:admin_user) { create(:user, :admin, :developer) }
  let!(:active_project) { create(:project) }
  let!(:potential_project) { create(:project, :potential) }
  let!(:archived_project) { create(:project, :archived) }
  let!(:potential_archived_project) { create(:project, :potential, :archived) }

  let(:projects_page) { App.new.projects_page }

  let(:go_to_active_tab) { visit '/dashboard/active' }
  let(:go_to_potential_tab) { visit '/dashboard/potential' }
  let(:go_to_archived_tab) { visit '/dashboard/archived' }

  before do
    allow_any_instance_of(SendMailJob).to receive(:perform)
    log_in_as admin_user
    projects_page.load
  end

  describe 'sections' do
    it 'has all the expected sections' 


    it 'has Active/Potential/Archived tabs' 


    it 'has all the dropdown and checkbox filters' 

  end

  describe 'project row' do
    context 'when on Active tab' do
      it 'has action icon (archive)' 


      it 'displays proper projects' 


      it 'allows adding memberships to an active project' 


      describe 'show next' do
        let!(:future_membership) { create(:membership, :future, project: active_project) }

        before { go_to_active_tab }

        context 'when checked' do
          it 'shows future memberships' 

        end

        context 'when unchecked' do
          it 'does not show future memberships' 

        end
      end

      describe 'people in project' do
        let!(:project_membership) { create(:membership, project: active_project) }
        let!(:future_project_membership) { create(:membership, :future, project: active_project) }

        before { go_to_active_tab }

        it 'shows number of present people in project' 

      end
    end

    context 'when on Potential tab' do
      before { go_to_potential_tab }

      it 'displays action icon (archive)' 


      it 'displays proper projects' 


      it 'allows adding memberships to a potential project' 

    end

    context 'when on Archived tab' do
      before { go_to_archived_tab }

      it 'displays all archived projects' 


      it 'does not display active and potential non-archived projects' 


      it 'displays action icon (unarchive)' 


      it 'does not allow adding memberships to an archived project' 

    end
  end

  describe 'managing people in projects' do

    describe 'adding member to project' do
      before { go_to_active_tab }

      it 'adds member to project correctly' 

    end

    describe 'ending membership in a regular project' do
      let!(:membership) { create(:membership, user: admin_user, project: active_project, ends_at: nil) }

      before { go_to_active_tab }

      it 'sets and end date for a membership' 

    end
  end

  describe 'managing notes' do
    describe 'add a new note' do
      before do
        go_to_active_tab
        projects_page.projects.first.notes_button.click
      end

      it 'add a note to the project' 

    end

    describe 'remove note' do
      let!(:note) { create(:note) }

      before do
        create(:note, user: admin_user, project: active_project)
        go_to_active_tab
        projects_page.projects.first.notes_button.click
      end

      it 'remove a note' 

    end
  end
end

