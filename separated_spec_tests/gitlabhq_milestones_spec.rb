require 'spec_helper'

feature 'Dashboard > Milestones' do
  describe 'as anonymous user' do
    before do
      visit dashboard_milestones_path
    end

    it 'is redirected to sign-in page' 

  end

  describe 'as logged-in user' do
    let(:user) { create(:user) }
    let(:project) { create(:project, namespace: user.namespace) }
    let!(:milestone) { create(:milestone, project: project) }
    before do
      project.add_master(user)
      sign_in(user)
      visit dashboard_milestones_path
    end

    it 'sees milestones' 

  end
end

