require 'rails_helper'

describe 'Dropdown emoji', :js do
  include FilteredSearchHelpers

  let!(:project) { create(:project, :public) }
  let!(:user) { create(:user, name: 'administrator', username: 'root') }
  let!(:issue) { create(:issue, project: project) }
  let!(:award_emoji_star) { create(:award_emoji, name: 'star', user: user, awardable: issue) }
  let(:filtered_search) { find('.filtered-search') }
  let(:js_dropdown_emoji) { '#js-dropdown-my-reaction' }

  def send_keys_to_filtered_search(input)
    input.split("").each do |i|
      filtered_search.send_keys(i)
    end

    sleep 0.5
    wait_for_requests
  end

  def dropdown_emoji_size
    page.all('#js-dropdown-my-reaction .filter-dropdown .filter-dropdown-item').size
  end

  def click_emoji(text)
    find('#js-dropdown-my-reaction .filter-dropdown .filter-dropdown-item', text: text).click
  end

  before do
    project.add_master(user)
    create_list(:award_emoji, 2, user: user, name: 'thumbsup')
    create_list(:award_emoji, 1, user: user, name: 'thumbsdown')
    create_list(:award_emoji, 3, user: user, name: 'star')
    create_list(:award_emoji, 1, user: user, name: 'tea')
  end

  context 'when user not logged in' do
    before do
      visit project_issues_path(project)
    end

    describe 'behavior' do
      it 'does not open when the search bar has my-reaction:' 

    end
  end

  context 'when user loggged in' do
    before do
      sign_in(user)

      visit project_issues_path(project)
    end

    describe 'behavior' do
      it 'opens when the search bar has my-reaction:' 


      it 'closes when the search bar is unfocused' 


      it 'should show loading indicator when opened' 


      it 'should hide loading indicator when loaded' 


      it 'should load all the emojis when opened' 


      it 'shows the most populated emoji at top of dropdown' 

    end

    describe 'filtering' do
      before do
        filtered_search.set('my-reaction')
        send_keys_to_filtered_search(':')
      end

      it 'filters by name' 


      it 'filters by case insensitive name' 

    end

    describe 'selecting from dropdown' do
      before do
        filtered_search.set('my-reaction')
        send_keys_to_filtered_search(':')
      end

      it 'fills in the my-reaction name' 

    end

    describe 'input has existing content' do
      it 'opens my-reaction dropdown with existing search term' 


      it 'opens my-reaction dropdown with existing assignee' 


      it 'opens my-reaction dropdown with existing label' 


      it 'opens my-reaction dropdown with existing milestone' 


      it 'opens my-reaction dropdown with existing my-reaction' 

    end

    describe 'caching requests' do
      it 'caches requests after the first load' 

    end
  end
end

