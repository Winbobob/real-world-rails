require 'spec_helper'

describe 'User visits the profile preferences page' do
  let(:user) { create(:user) }

  before do
    sign_in(user)

    visit(profile_preferences_path)
  end

  it 'shows correct menu item' 


  describe 'User changes their syntax highlighting theme', :js do
    it 'creates a flash message' 


    it 'updates their preference' 

  end

  describe 'User changes their default dashboard', :js do
    it 'creates a flash message' 


    it 'updates their preference' 

  end

  def expect_preferences_saved_message
    page.within('.flash-container') do
      expect(page).to have_content('Preferences saved.')
    end
  end
end

