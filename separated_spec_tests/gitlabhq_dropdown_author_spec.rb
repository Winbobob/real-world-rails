require 'rails_helper'

describe 'Dropdown author', :js do
  include FilteredSearchHelpers

  let!(:project) { create(:project) }
  let!(:user) { create(:user, name: 'administrator', username: 'root') }
  let!(:user_john) { create(:user, name: 'John', username: 'th0mas') }
  let!(:user_jacob) { create(:user, name: 'Jacob', username: 'ooter32') }
  let(:filtered_search) { find('.filtered-search') }
  let(:js_dropdown_author) { '#js-dropdown-author' }

  def send_keys_to_filtered_search(input)
    input.split("").each do |i|
      filtered_search.send_keys(i)
    end

    sleep 0.5
    wait_for_requests
  end

  def dropdown_author_size
    page.all('#js-dropdown-author .filter-dropdown .filter-dropdown-item').size
  end

  def click_author(text)
    find('#js-dropdown-author .filter-dropdown .filter-dropdown-item', text: text).click
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
    it 'opens when the search bar has author:' 


    it 'closes when the search bar is unfocused' 


    it 'should show loading indicator when opened' 


    it 'should hide loading indicator when loaded' 


    it 'should load all the authors when opened' 


    it 'shows current user at top of dropdown' 

  end

  describe 'filtering' do
    before do
      filtered_search.set('author')
      send_keys_to_filtered_search(':')
    end

    it 'filters by name' 


    it 'filters by case insensitive name' 


    it 'filters by username with symbol' 


    it 'filters by username without symbol' 


    it 'filters by case insensitive username without symbol' 

  end

  describe 'selecting from dropdown' do
    before do
      filtered_search.set('author')
      send_keys_to_filtered_search(':')
    end

    it 'fills in the author username when the author has not been filtered' 


    it 'fills in the author username when the author has been filtered' 

  end

  describe 'selecting from dropdown without Ajax call' do
    before do
      Gitlab::Testing::RequestBlockerMiddleware.block_requests!
      filtered_search.set('author:')
    end

    after do
      Gitlab::Testing::RequestBlockerMiddleware.allow_requests!
    end

    it 'selects current user' 

  end

  describe 'input has existing content' do
    it 'opens author dropdown with existing search term' 


    it 'opens author dropdown with existing assignee' 


    it 'opens author dropdown with existing label' 


    it 'opens author dropdown with existing milestone' 

  end

  describe 'caching requests' do
    it 'caches requests after the first load' 

  end
end

