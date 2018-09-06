require 'spec_helper'

describe 'Recent searches', :js do
  include FilteredSearchHelpers

  let(:project_1) { create(:project, :public) }
  let(:project_2) { create(:project, :public) }
  let(:project_1_local_storage_key) { "#{project_1.full_path}-issue-recent-searches" }

  before do
    Capybara.ignore_hidden_elements = false
    create(:issue, project: project_1)
    create(:issue, project: project_2)

    # Visit any fast-loading page so we can clear local storage without a DOM exception
    visit '/404'
    remove_recent_searches
  end

  after do
    Capybara.ignore_hidden_elements = true
  end

  it 'searching adds to recent searches' 


  it 'visiting URL with search params adds to recent searches' 


  it 'saved recent searches are restored last on the list' 


  it 'searches are scoped to projects' 


  it 'clicking item fills search input' 


  it 'clear recent searches button, clears recent searches' 


  it 'shows flash error when failed to parse saved history' 

end

