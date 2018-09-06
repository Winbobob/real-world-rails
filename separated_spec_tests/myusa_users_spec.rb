
require 'feature_helper'

describe 'Users' do
  let(:email) { 'test-user@testy.com' }
  let(:user) { FactoryGirl.create(:user, email: email) }

  let(:sign_in_page) { SignInPage.new }
  let(:profile_page) { ProfilePage.new }
  let(:additional_profile_page) { AdditionalProfilePage.new }


  describe 'change your name' do
    context 'user is not signed in' do
      it 'should display need to sign in warning' 

    end

    context 'user is signed in' do
      before do
        login(user)
        profile_page.load
      end

      it "should change the user's name when first or last name changes" 


      it "should allow setting a 'Yes/No' field to blank" 

    end
  end

end

