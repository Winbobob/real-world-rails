require 'rails_helper'

describe 'Dropdown assignee', :js do
  include FilteredSearchHelpers

  let!(:project) { create(:project) }
  let!(:user) { create(:user, name: 'administrator', username: 'root') }
  let!(:user_john) { create(:user, name: 'John', username: 'th0mas') }
  let!(:user_jacob) { create(:user, name: 'Jacob', username: 'otter32') }
  let(:filtered_search) { find('.filtered-search') }
  let(:js_dropdown_assignee) { '#js-dropdown-assignee' }
  let(:filter_dropdown) { find("#{js_dropdown_assignee} .filter-dropdown") }

  def dropdown_assignee_size
    filter_dropdown.all('.filter-dropdown-item').size
  end

  def click_assignee(text)
    find('#js-dropdown-assignee .filter-dropdown .filter-dropdown-item', text: text).click
  end

  before do
    project.add_master(user)
    project.add_master(user_john)
    project.add_master(user_jacob)
    sign_in(user)
    create(:issue, project: project)

    visit project_issues_path(project)
  end

  describe 'behavior' do
    it 'opens when the search bar has assignee:' 


    it 'closes when the search bar is unfocused' 


    it 'should show loading indicator when opened' 


    it 'should hide loading indicator when loaded' 


    it 'should load all the assignees when opened' 


    it 'shows current user at top of dropdown' 

  end

  describe 'filtering' do
    before do
      filtered_search.set('assignee:')

      expect(find("#{js_dropdown_assignee} .filter-dropdown")).to have_content(user_john.name)
      expect(find("#{js_dropdown_assignee} .filter-dropdown")).to have_content(user_jacob.name)
      expect(find("#{js_dropdown_assignee} .filter-dropdown")).to have_content(user.name)
    end

    it 'filters by name' 


    it 'filters by case insensitive name' 


    it 'filters by username with symbol' 


    it 'filters by case insensitive username with symbol' 


    it 'filters by username without symbol' 


    it 'filters by case insensitive username without symbol' 

  end

  describe 'selecting from dropdown' do
    before do
      filtered_search.set('assignee:')
    end

    it 'fills in the assignee username when the assignee has not been filtered' 


    it 'fills in the assignee username when the assignee has been filtered' 


    it 'selects `no assignee`' 

  end

  describe 'selecting from dropdown without Ajax call' do
    before do
      Gitlab::Testing::RequestBlockerMiddleware.block_requests!
      filtered_search.set('assignee:')
    end

    after do
      Gitlab::Testing::RequestBlockerMiddleware.allow_requests!
    end

    it 'selects current user' 

  end

  describe 'input has existing content' do
    it 'opens assignee dropdown with existing search term' 


    it 'opens assignee dropdown with existing author' 


    it 'opens assignee dropdown with existing label' 


    it 'opens assignee dropdown with existing milestone' 


    it 'opens assignee dropdown with existing my-reaction' 

  end

  describe 'caching requests' do
    it 'caches requests after the first load' 

  end
end

