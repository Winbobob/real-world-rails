require 'spec_helper'

describe 'Users > Terms' do
  include TermsHelper

  let(:user) { create(:user) }
  let!(:term) { create(:term, terms: 'By accepting, you promise to be nice!') }

  before do
    stub_env('IN_MEMORY_APPLICATION_SETTINGS', 'false')
    sign_in(user)
  end

  it 'shows the terms' 


  context 'declining the terms' do
    it 'returns the user to the app' 

  end

  context 'accepting the terms' do
    it 'returns the user to the app' 

  end

  context 'terms were enforced while session is active', :js do
    let(:project) { create(:project) }

    before do
      project.add_developer(user)
    end

    it 'redirects to terms and back to where the user was going'  do
      visit project_path(project)

      enforce_terms

      within('.nav-sidebar') do
        click_link 'Issues'
      end

      expect_to_be_on_terms_page

      click_button('Accept terms')

      expect(current_path).to eq(project_issues_path(project))
    end

    it 'redirects back to the page the user was trying to save' 

  end
end

