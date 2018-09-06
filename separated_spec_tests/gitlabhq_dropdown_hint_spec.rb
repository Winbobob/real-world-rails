require 'rails_helper'

describe 'Dropdown hint', :js do
  include FilteredSearchHelpers

  let!(:project) { create(:project, :public) }
  let!(:user) { create(:user) }
  let(:filtered_search) { find('.filtered-search') }
  let(:js_dropdown_hint) { '#js-dropdown-hint' }

  def click_hint(text)
    find('#js-dropdown-hint .filter-dropdown .filter-dropdown-item', text: text).click
  end

  before do
    project.add_master(user)
    create(:issue, project: project)
  end

  context 'when user not logged in' do
    before do
      visit project_issues_path(project)
    end

    it 'does not exist my-reaction dropdown item' 

  end

  context 'when user logged in' do
    before do
      sign_in(user)

      visit project_issues_path(project)
    end

    describe 'behavior' do
      before do
        expect(page).to have_css(js_dropdown_hint, visible: false)
        filtered_search.click
      end

      it 'opens when the search bar is first focused' 


      it 'closes when the search bar is unfocused' 

    end

    describe 'filtering' do
      it 'does not filter `Press Enter or click to search`' 


      it 'filters with text' 

    end

    describe 'selecting from dropdown with no input' do
      before do
        filtered_search.click
      end

      it 'opens the author dropdown when you click on author' 


      it 'opens the assignee dropdown when you click on assignee' 


      it 'opens the milestone dropdown when you click on milestone' 


      it 'opens the label dropdown when you click on label' 


      it 'opens the emoji dropdown when you click on my-reaction' 

    end

    describe 'selecting from dropdown with some input' do
      it 'opens the author dropdown when you click on author' 


      it 'opens the assignee dropdown when you click on assignee' 


      it 'opens the milestone dropdown when you click on milestone' 


      it 'opens the label dropdown when you click on label' 


      it 'opens the emoji dropdown when you click on my-reaction' 

    end

    describe 'reselecting from dropdown' do
      it 'reuses existing author text' 


      it 'reuses existing assignee text' 


      it 'reuses existing milestone text' 


      it 'reuses existing label text' 


      it 'reuses existing emoji text' 

    end
  end
end

