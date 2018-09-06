require 'spec_helper'

describe Api::V1::GardensController, type: :controller do
  include ApiHelpers

  describe 'index' do
    before do
      @viewing_user = FactoryGirl.create :confirmed_user
      @other_user = FactoryGirl.create :confirmed_user
      sign_in @viewing_user
    end

    # These are not yet implemented because index is
    # funny about nested things.
    it 'should show non private gardens and gardens belonging to a user'

    it 'should show all gardens if the user is admin'
  end

  describe 'show' do
    before do
      @viewing_user = FactoryGirl.create :confirmed_user
      @other_user = FactoryGirl.create :confirmed_user
      sign_in @viewing_user
    end

    it 'should show admins gardens regardless of privacy setting' 


    it 'should shown not signed in users only public gardens' 


    it 'should not show private gardens to ordinary users' 


    it 'should show the user their private and public gardens' 

  end

  describe 'create' do
    before do
      @viewing_user = FactoryGirl.create :confirmed_user
      sign_in @viewing_user
    end

    it 'should create a garden' 


    it 'should prevent non-logged in users from creating a garden'

    it 'should give garden-creator badge when user creates a second garden' 

  end

  describe 'update' do
    before do
      @viewing_user = FactoryGirl.create :user
      sign_in @viewing_user
    end

    it 'should not allow editing of non-owned gardens' 


    it 'should edit owned gardens' 

  end

  describe 'destroy' do
    let(:user) { FactoryGirl.create(:user) }

    it 'deletes gardens' 


    it 'returns an error when a garden does not exist' 


    it 'only destroys gardens owned by the user' 

  end
end

