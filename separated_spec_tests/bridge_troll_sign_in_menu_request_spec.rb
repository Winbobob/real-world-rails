require 'rails_helper'
require Rails.root.join('spec', 'services', 'omniauth_responses')

describe "sign in lightbox" do
  before do
    @user = create(:user)
  end

  it "shows on home page on click" 


  it "does not show if signed in" 


  describe "when the user visits an authenticated page, then leaves and goes to an unauthenticated one", js: true do
    before do
      visit "/users"
      within '.alert' do
        expect(page).to have_content('sign in')
      end
      visit "/about"
      expect(page).to have_content("Bridge Troll's Features for Organizers")
    end

    context "with password auth" do
      it "always returns the user to the current page, instead of the last path Devise remembers" 

    end

    context "with omniauth" do
      let(:facebook_response) { OmniauthResponses.facebook_response }

      before do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(facebook_response)
        @user.authentications.create(provider: :facebook, uid: facebook_response[:uid])
      end

      it "always returns the user to the current page, instead of the last path Devise remembers" 

    end
  end
end

describe "user" do
  before do
    @user = create(:user)
  end

  it "can sign in from the home page" 

end

