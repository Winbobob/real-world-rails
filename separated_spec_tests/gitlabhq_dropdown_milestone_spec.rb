require 'rails_helper'

describe 'Dropdown milestone', :js do
  include FilteredSearchHelpers

  let!(:project) { create(:project) }
  let!(:user) { create(:user) }
  let!(:milestone) { create(:milestone, title: 'v1.0', project: project) }
  let!(:uppercase_milestone) { create(:milestone, title: 'CAP_MILESTONE', project: project) }
  let!(:two_words_milestone) { create(:milestone, title: 'Future Plan', project: project) }
  let!(:wont_fix_milestone) { create(:milestone, title: 'Won"t Fix', project: project) }
  let!(:special_milestone) { create(:milestone, title: '!@#$%^&*(+)', project: project) }
  let!(:long_milestone) { create(:milestone, title: 'this is a very long title this is a very long title this is a very long title this is a very long title this is a very long title', project: project) }

  let(:filtered_search) { find('.filtered-search') }
  let(:js_dropdown_milestone) { '#js-dropdown-milestone' }
  let(:filter_dropdown) { find("#{js_dropdown_milestone} .filter-dropdown") }

  def dropdown_milestone_size
    filter_dropdown.all('.filter-dropdown-item').size
  end

  def click_milestone(text)
    find('#js-dropdown-milestone .filter-dropdown .filter-dropdown-item', text: text).click
  end

  def click_static_milestone(text)
    find('#js-dropdown-milestone .filter-dropdown-item', text: text).click
  end

  before do
    project.add_master(user)
    sign_in(user)
    create(:issue, project: project)

    visit project_issues_path(project)
  end

  describe 'behavior' do
    it 'opens when the search bar has milestone:' 


    it 'closes when the search bar is unfocused' 


    it 'should show loading indicator when opened' 


    it 'should hide loading indicator when loaded' 


    it 'should load all the milestones when opened' 

  end

  describe 'filtering' do
    before do
      filtered_search.set('milestone:')

      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(uppercase_milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(two_words_milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(wont_fix_milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(special_milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(long_milestone.title)
    end

    it 'filters by name' 


    it 'filters by case insensitive name' 


    it 'filters by name with symbol' 


    it 'filters by case insensitive name with symbol' 


    it 'filters by special characters' 


    it 'filters by special characters with symbol' 

  end

  describe 'selecting from dropdown' do
    before do
      filtered_search.set('milestone:')

      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(uppercase_milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(two_words_milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(wont_fix_milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(special_milestone.title)
      expect(find("#{js_dropdown_milestone} .filter-dropdown")).to have_content(long_milestone.title)
    end

    it 'fills in the milestone name when the milestone has not been filled' 


    it 'fills in the milestone name when the milestone is partially filled' 


    it 'fills in the milestone name that contains multiple words' 


    it 'fills in the milestone name that contains multiple words and is very long' 


    it 'fills in the milestone name that contains double quotes' 


    it 'fills in the milestone name with the correct capitalization' 


    it 'fills in the milestone name with special characters' 


    it 'selects `no milestone`' 


    it 'selects `upcoming milestone`' 


    it 'selects `started milestones`' 

  end

  describe 'input has existing content' do
    it 'opens milestone dropdown with existing search term' 


    it 'opens milestone dropdown with existing author' 


    it 'opens milestone dropdown with existing assignee' 


    it 'opens milestone dropdown with existing label' 


    it 'opens milestone dropdown with existing milestone' 


    it 'opens milestone dropdown with existing my-reaction' 

  end

  describe 'caching requests' do
    it 'caches requests after the first load' 

  end
end

