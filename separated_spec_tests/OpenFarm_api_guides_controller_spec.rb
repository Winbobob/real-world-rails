require 'spec_helper'

describe Api::V1::GuidesController, type: :controller do
  include ApiHelpers

  let(:user) { sign_in(user = FactoryGirl.create(:user)) && user }
  let(:guide) { FactoryGirl.create(:guide, user: user) }

  before do
    @beans_v2 = FactoryGirl.create(:guide, name: 'lee\'s mung bean')
    FactoryGirl.create_list(:guide, 2)
  end

  describe 'create' do
    it 'create guides' 


    it 'creates a crop if no crop was found' 


    it 'finds a crop if no crop was found on the frontend, but does exist' 


    it 'create guide should return an error when wrong info is passed' 


    it 'uploads a featured_image' 


    it 'should give current_user a badge for creating a guide' 

  end

  describe 'show' do
    it 'should show a specific guide' 

  end

  describe 'update' do

    it 'should update a guide' 


    it 'should not update someone elses guide' 


    it 'validates URL paramters' 

  end

  describe 'destroy' do
    it 'deletes guides' 


    it 'returns an error when a guide does not exist' 


    it 'only destroys guides owned by the user' 

  end
end

