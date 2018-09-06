require 'rails_helper'

describe 'Visual tokens', :js do
  include FilteredSearchHelpers

  let!(:project) { create(:project) }
  let!(:user) { create(:user, name: 'administrator', username: 'root') }
  let!(:user_rock) { create(:user, name: 'The Rock', username: 'rock') }
  let!(:milestone_nine) { create(:milestone, title: '9.0', project: project) }
  let!(:milestone_ten) { create(:milestone, title: '10.0', project: project) }
  let!(:label) { create(:label, project: project, title: 'abc') }
  let!(:cc_label) { create(:label, project: project, title: 'Community Contribution') }

  let(:filtered_search) { find('.filtered-search') }
  let(:filter_author_dropdown) { find("#js-dropdown-author .filter-dropdown") }
  let(:filter_assignee_dropdown) { find("#js-dropdown-assignee .filter-dropdown") }
  let(:filter_milestone_dropdown) { find("#js-dropdown-milestone .filter-dropdown") }
  let(:filter_label_dropdown) { find("#js-dropdown-label .filter-dropdown") }

  def is_input_focused
    page.evaluate_script("document.activeElement.classList.contains('filtered-search')")
  end

  before do
    project.add_user(user, :master)
    project.add_user(user_rock, :master)
    sign_in(user)
    create(:issue, project: project)

    set_cookie('sidebar_collapsed', 'true')

    visit project_issues_path(project)
  end

  describe 'editing author token' do
    before do
      input_filtered_search('author:@root assignee:none', submit: false)
      first('.tokens-container .filtered-search-token').click
    end

    it 'opens author dropdown' 


    it 'makes value editable' 


    it 'filters value' 


    it 'ends editing mode when document is clicked' 


    it 'ends editing mode when scroll container is clicked' 


    describe 'selecting different author from dropdown' do
      before do
        filter_author_dropdown.find('.filter-dropdown-item .dropdown-light-content', text: "@#{user_rock.username}").click
      end

      it 'changes value in visual token' 


      it 'moves input to the right' 

    end
  end

  describe 'editing assignee token' do
    before do
      input_filtered_search('assignee:@root author:none', submit: false)
      first('.tokens-container .filtered-search-token').double_click
    end

    it 'opens assignee dropdown' 


    it 'makes value editable' 


    it 'filters value' 


    it 'ends editing mode when document is clicked' 


    it 'ends editing mode when scroll container is clicked' 


    describe 'selecting static option from dropdown' do
      before do
        find("#js-dropdown-assignee").find('.filter-dropdown-item', text: 'No Assignee').click
      end

      it 'changes value in visual token' 


      it 'moves input to the right' 

    end
  end

  describe 'editing milestone token' do
    before do
      input_filtered_search('milestone:%10.0 author:none', submit: false)
      first('.tokens-container .filtered-search-token').click
      first('#js-dropdown-milestone .filter-dropdown .filter-dropdown-item')
    end

    it 'opens milestone dropdown' 


    it 'selects static option from dropdown' 


    it 'makes value editable' 


    it 'filters value' 


    it 'ends editing mode when document is clicked' 


    it 'ends editing mode when scroll container is clicked' 

  end

  describe 'editing label token' do
    before do
      input_filtered_search("label:~#{label.title} author:none", submit: false)
      first('.tokens-container .filtered-search-token').double_click
      first('#js-dropdown-label .filter-dropdown .filter-dropdown-item')
    end

    it 'opens label dropdown' 


    it 'selects option from dropdown' 


    it 'makes value editable' 


    it 'filters value' 


    it 'ends editing mode when document is clicked' 


    it 'ends editing mode when scroll container is clicked' 

  end

  describe 'editing multiple tokens' do
    before do
      input_filtered_search('author:@root assignee:none', submit: false)
      first('.tokens-container .filtered-search-token').double_click
    end

    it 'opens author dropdown' 


    it 'opens assignee dropdown' 

  end

  describe 'editing a search term while editing another filter token' do
    before do
      input_filtered_search('author assignee:', submit: false)
      first('.tokens-container .filtered-search-term').double_click
    end

    it 'opens hint dropdown' 


    it 'opens author dropdown' 

  end

  describe 'add new token after editing existing token' do
    before do
      input_filtered_search('author:@root assignee:none', submit: false)
      first('.tokens-container .filtered-search-token').double_click
      filtered_search.send_keys(' ')
    end

    describe 'opens dropdowns' do
      it 'opens hint dropdown' 


      it 'opens author dropdown' 


      it 'opens assignee dropdown' 


      it 'opens milestone dropdown' 


      it 'opens label dropdown' 

    end

    describe 'creates visual tokens' do
      it 'creates author token' 


      it 'creates assignee token' 


      it 'creates milestone token' 


      it 'creates label token' 

    end

    it 'does not tokenize incomplete token' 

  end

  describe 'search using incomplete visual tokens' do
    before do
      input_filtered_search('author:@root assignee:none', extra_space: false)
    end

    it 'tokenizes the search term to complete visual token' 

  end
end

