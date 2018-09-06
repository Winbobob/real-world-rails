require 'spec_helper'

feature 'User creates blob in new project', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, :empty_repo) }

  shared_examples 'creating a file' do
    before do
      sign_in(user)
      visit project_path(project)
    end

    it 'allows the user to add a new file' 

  end

  describe 'as a master' do
    before do
      project.add_master(user)
    end

    it_behaves_like 'creating a file'
  end

  describe 'as an admin' do
    let(:user) { create(:user, :admin) }

    it_behaves_like 'creating a file'
  end

  describe 'as a developer' do
    before do
      project.add_developer(user)
      sign_in(user)
      visit project_path(project)
    end

    it 'does not allow pushing to the default branch' 

  end
end

