# frozen_string_literal: true

require 'rails_helper'

describe 'campaigns page', type: :feature, js: true do
  let(:user) { create(:user) }

  context 'hiding campaign creation' do
    it 'should not show the create button if the feature flag is off' 


    it 'should not show the create button if the user is logged out' 

  end

  context 'campaigns list' do
    it 'should list the campaigns' 

  end

  context 'campaign create modal' do
    before do
      allow(Features).to receive(:open_course_creation?).and_return(true)
      login_as(user, scope: :user)
      visit '/campaigns'
    end

    it 'appears when you click on the create button' 


    it 'disappears when you click on cancel' 


    it 'show errors if the created campaign is invalid with the modal is open' 


    it 'creates a campaign with the given values when submitted' 


    it 'can be reached from the explore page' 

  end
end

