require 'spec_helper'

describe 'Dashboard > User filters projects' do
  let(:user) { create(:user) }
  let(:project) { create(:project, name: 'Victorialand', namespace: user.namespace) }
  let(:user2) { create(:user) }
  let(:project2) { create(:project, name: 'Treasure', namespace: user2.namespace) }

  before do
    project.add_master(user)

    sign_in(user)
  end

  describe 'filtering personal projects' do
    before do
      project2.add_developer(user)

      visit dashboard_projects_path
    end

    it 'filters by projects "Owned by me"' 

  end

  describe 'filtering starred projects', :js do
    before do
      user.toggle_star(project)

      visit dashboard_projects_path
    end

    it 'returns message when starred projects fitler returns no results' 

  end
end

