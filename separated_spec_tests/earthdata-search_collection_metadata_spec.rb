require 'spec_helper'

describe 'Collection metadata', reset: false do
  before do
    load_page :search, ac: true
    fill_in 'keywords', with: 'AST_L1AE'
    find('li', text: 'ASTER Expedited L1A').click_link "View collection details"
    wait_for_xhr
    click_link 'View More Metadata'
  end

  it 'provides metadata in multiple formats' 


  context 'when a logged in user views collection metadata' do
    before do
      login
      wait_for_xhr
      click_link 'View More Metadata'
    end

    it 'provides metadata in multiple formats without user tokens' 

  end
end

