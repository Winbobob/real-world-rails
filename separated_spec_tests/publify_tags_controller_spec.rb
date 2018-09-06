require 'rails_helper'

describe Admin::TagsController, type: :controller do
  render_views

  let!(:blog) { create(:blog) }
  let!(:user) { create(:user, :as_admin) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' 


    it 'renders the index template' 

  end

  describe 'create a new tag' do
    it 'should create a tag and redirect to #index' 


    it 'renders #index on error' 

  end

  describe 'GET #edit' do
    before(:each) do
      get :edit, params: { id: FactoryGirl.create(:tag).id }
    end

    it 'renders the edit template with an HTTP 200 status code' 

  end

  describe '#update an existing tag' do
    it 'should update a tag and redirect to #index' 

  end

  describe 'destroy a tag' do
    it 'should destroy the tag and redirect to #index' 

  end
end

