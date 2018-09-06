require 'feature_helper'

describe 'Admin' do
  let(:profile_page) { ProfilePage.new }
  let(:admin_page) { AdminPage.new }

  let(:user) { FactoryGirl.create(:admin_user, :with_2fa) }
  let(:two_factor) { false }

  before :each do
    login user, two_factor: two_factor
  end

  describe 'navigation to admin page' do
    before :each do
      profile_page.load
    end

    context 'user is admin' do
      let(:two_factor) { true }

      it 'can navigate to admin from dropdown menu' 


      it 'can navigate to admin from profile nav' 

    end

    context 'user is not admin' do
      let(:user) { FactoryGirl.create(:user) }

      it 'does not have admin link in drop down menu' 


      it 'does not have admin link profile nav' 

    end
  end

  describe 'app approval' do
    before :each do
      FactoryGirl.create(:application, name: 'App 1', public: false, requested_public_at: Time.now, owner: user)
      FactoryGirl.create(:application, name: 'App 2', public: false, requested_public_at: Time.now, owner: user)
      login user, two_factor: true
      admin_page.load
      admin_page.pending_approval_link.click
    end

    it 'can see apps pending approval' 


    it 'can approve an app' 

  end
end

