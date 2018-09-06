require 'spec_helper'

describe 'Dropdown label', :js do
  include FilteredSearchHelpers

  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:filtered_search) { find('.filtered-search') }
  let(:js_dropdown_label) { '#js-dropdown-label' }
  let(:filter_dropdown) { find("#{js_dropdown_label} .filter-dropdown") }

  shared_context 'with labels' do
    let!(:bug_label) { create(:label, project: project, title: 'bug-label') }
    let!(:uppercase_label) { create(:label, project: project, title: 'BUG-LABEL') }
    let!(:two_words_label) { create(:label, project: project, title: 'High Priority') }
    let!(:wont_fix_label) { create(:label, project: project, title: 'Won"t Fix') }
    let!(:wont_fix_single_label) { create(:label, project: project, title: 'Won\'t Fix') }
    let!(:special_label) { create(:label, project: project, title: '!@#$%^+&*()') }
    let!(:long_label) { create(:label, project: project, title: 'this is a very long title this is a very long title this is a very long title this is a very long title this is a very long title') }
  end

  def search_for_label(label)
    init_label_search
    filtered_search.send_keys(label)
  end

  def click_label(text)
    filter_dropdown.find('.filter-dropdown-item', text: text).click
  end

  def clear_search_field
    find('.filtered-search-box .clear-search').click
  end

  before do
    project.add_master(user)
    sign_in(user)
    create(:issue, project: project)

    visit project_issues_path(project)
  end

  describe 'keyboard navigation' do
    it 'selects label' 

  end

  describe 'behavior' do
    it 'opens when the search bar has label:' 


    it 'closes when the search bar is unfocused' 


    it 'shows loading indicator when opened and hides it when loaded' 


    it 'loads all the labels when opened' 

  end

  describe 'filtering' do
    include_context 'with labels'

    before do
      init_label_search
    end

    it 'filters by case-insensitive name with or without symbol' 


    it 'filters by multiple words with or without symbol' 


    it 'filters by multiple words containing single quotes with or without symbol' 


    it 'filters by multiple words containing double quotes with or without symbol' 


    it 'filters by special characters with or without symbol' 

  end

  describe 'selecting from dropdown' do
    include_context 'with labels'

    before do
      init_label_search
    end

    it 'fills in the label name when the label has not been filled' 


    it 'fills in the label name when the label is partially filled' 


    it 'fills in the label name that contains multiple words' 


    it 'fills in the label name that contains multiple words and is very long' 


    it 'fills in the label name that contains double quotes' 


    it 'fills in the label name with the correct capitalization' 


    it 'fills in the label name with special characters' 


    it 'selects `no label`' 

  end

  describe 'input has existing content' do
    it 'opens label dropdown with existing search term' 


    it 'opens label dropdown with existing author' 


    it 'opens label dropdown with existing assignee' 


    it 'opens label dropdown with existing label' 


    it 'opens label dropdown with existing milestone' 


    it 'opens label dropdown with existing my-reaction' 

  end

  describe 'caching requests' do
    it 'caches requests after the first load' 

  end
end

