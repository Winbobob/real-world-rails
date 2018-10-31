require 'rails_helper'

describe 'Projects', type: :request do
  let(:user) { create :user, email_frequency: 'daily' }
  subject { page }

  before do
    mock_is_admin
  end

  describe 'project index' do
    before do
      2.times { create :project }
      visit projects_path
    end

    it { is_expected.to have_content '2 Suggested Projects' }
  end

  describe 'suggesting a new project' do
    before do
      login user
      visit dashboard_path
    end

    it 'allows the user to suggest a project to contribute to' 

  end

  describe 'filtering the project list', :js do

    context 'as logged-in user' do
      before do
        create :project, name: 'Ruby project', main_language: 'Ruby'
        create :project, name: 'Java project', main_language: 'Java'
        user.skills.create! language: 'Ruby'
        login user
        visit projects_path
      end

      it 'should show projects with the users languages by default' 


      it 'should display projects for any selected languages' 


      it 'should reset active filter when clicking "All Languages"' 


      it 'should retain selected filters when requesting more pages' 

    end
  end

  describe 'editing suggested projects' do

    let!(:user_project) { create :project, name: 'Java project', main_language: 'Java', submitted_by: user }
    let!(:other_project) { create :project, name: 'Ruby project', main_language: 'Ruby' }

    before do
      login user
      visit my_suggestions_path
    end

    context 'a logged-in user' do
      it 'should be able to edit projects they have suggested' 


      it 'can deactivate a project' 


      it 'can delete a project' 

    end

    it "should not be able to edit other user's suggestions" 

  end
end

