require 'rails_helper'

describe 'Search bar', :js do
  include FilteredSearchHelpers

  let!(:project) { create(:project) }
  let!(:user) { create(:user) }
  let(:filtered_search) { find('.filtered-search') }

  before do
    project.add_master(user)
    sign_in(user)
    create(:issue, project: project)

    visit project_issues_path(project)
  end

  def get_left_style(style)
    left_style = /left:\s\d*[.]\d*px/.match(style)
    left_style.to_s.gsub('left: ', '').to_f
  end

  describe 'keyboard navigation' do
    it 'makes item active' 


    it 'selects item' 

  end

  describe 'clear search button' do
    it 'clears text' 


    it 'hides by default' 


    it 'hides after clicked' 


    it 'hides when there is no text' 


    it 'shows when there is text' 


    it 'resets the dropdown hint filter' 


    it 'resets the dropdown filters' 

  end
end

