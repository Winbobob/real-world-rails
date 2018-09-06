require 'spec_helper'

describe Api::V1::GardenCropsController, type: :controller do
  include ApiHelpers

  describe 'create' do
    before do
      @user = FactoryGirl.create :user
      sign_in @user
    end

    it 'should create garden crops' 


    it 'should give the user a gardener badge on adding a garden crop' 


    it 'should not allow user to add garden crops to other user gardens' 

  end

  describe 'destroy' do
    before do
      @user = FactoryGirl.create :user
      sign_in @user
    end

    it 'should delete garden crops' 


    it 'should not delete garden crops of other users gardens' 


    it 'should handle deletion of unknown garden crops' 

  end

  describe 'index' do
    before do
      @user = FactoryGirl.create :user
      sign_in @user
    end
    it 'should show garden crops for a specific garden' 


    it 'should not show garden crops for a private garden' 


    it 'should return a not found error for non-existent garden' 

  end

  describe 'show' do
    before do
      @user = FactoryGirl.create :user
      sign_in @user
      @garden = FactoryGirl.create(:garden, user: @user)
    end

    it 'should return a not found error for non-existent garden' 


    it 'should return a not found error for non-existent garden crops' 


    it 'should show a garden_crop with a crop' 


    it 'should show a garden_crop with a guide' 


    it 'should show a garden crop that exists' 


    it 'should not show garden crops that belong to a private garden' 


    it 'should show private garden crops to admin' 

  end

  describe 'update' do
    it 'should update a garden crop' 

    it 'should not update garden crops belonging to other users' 

  end
end

