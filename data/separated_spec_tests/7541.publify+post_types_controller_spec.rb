# frozen_string_literal: true

require 'rails_helper'

describe Admin::PostTypesController, type: :controller do
  render_views

  before do
    create(:blog)
    user = create(:user, :as_admin)
    sign_in user
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' 


    it 'renders the index template' 

  end

  describe 'create a new post_type' do
    it 'creates a post and redirect to #index' 

  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: create(:post_type).id }
    end

    it 'renders the edit template with an HTTP 200 status code' 

  end

  describe '#update an existing post_type' do
    it 'updates a post_type and redirect to #index' 

  end

  describe 'destroy a post_type' do
    it 'destroys the post_type and redirect to #index' 

  end
end

