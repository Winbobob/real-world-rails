require 'spec_helper'

feature 'Dashboard > User filters todos', :js do
  let(:user_1)    { create(:user, username: 'user_1', name: 'user_1') }
  let(:user_2)    { create(:user, username: 'user_2', name: 'user_2') }

  let(:project_1) { create(:project, name: 'project_1') }
  let(:project_2) { create(:project, name: 'project_2') }

  let(:issue) { create(:issue, title: 'issue', project: project_1) }

  let!(:merge_request) { create(:merge_request, source_project: project_2, title: 'merge_request') }

  before do
    create(:todo, user: user_1, author: user_2, project: project_1, target: issue, action: 1)
    create(:todo, user: user_1, author: user_1, project: project_2, target: merge_request, action: 2)

    project_1.add_developer(user_1)
    project_2.add_developer(user_1)
    sign_in(user_1)
    visit dashboard_todos_path
  end

  it 'filters by project' 


  context 'Author filter' do
    it 'filters by author' 


    it 'shows only authors of existing todos' 


    it 'shows only authors of existing done todos' 

  end

  it 'filters by type' 


  describe 'filter by action' do
    before do
      create(:todo, :build_failed, user: user_1, author: user_2, project: project_1)
      create(:todo, :marked, user: user_1, author: user_2, project: project_1, target: issue)
    end

    it 'filters by Assigned' 


    it 'filters by Mentioned' 


    it 'filters by Added' 


    it 'filters by Pipelines' 


    def filter_action(name)
      click_button 'Action'
      within '.dropdown-menu-action' do
        click_link name
      end

      wait_for_requests
    end

    def expect_to_see_action(action_name)
      action_names = {
        assigned: ' assigned you ',
        mentioned: ' mentioned ',
        marked: ' added a todo for ',
        build_failed: ' build failed for '
      }

      action_name_text = action_names.delete(action_name)
      expect(find('.todos-list')).to have_content action_name_text
      action_names.each_value do |other_action_text|
        expect(find('.todos-list')).not_to have_content other_action_text
      end
    end
  end
end

