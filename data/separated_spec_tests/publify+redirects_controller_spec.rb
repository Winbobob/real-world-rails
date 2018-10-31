# frozen_string_literal: true

require 'rails_helper'

describe Admin::RedirectsController, type: :controller do
  before do
    create(:blog)
    admin = create(:user, :as_admin)
    sign_in admin
  end

  describe '#index' do
    it 'responds successfully with an HTTP 200 status code' 


    it 'renders the index template' 


    it 'assigns only redirects that are not linked to content' 


    context 'when rendering the view' do
      render_views

      it 'renders properly with no redirects present' 


      it 'renders properly with redirects present' 

    end
  end

  describe '#create' do
    it 'creates a new redirect and redirect to #index' 


    it 'creates a redirect with an empty from path and redirect to #index' 

  end

  describe 'GET #edit' do
    before do
      get :edit, params: { id: create(:redirect).id }
    end

    it 'renders the edit template with an HTTP 200 status code' 

  end

  describe '#update an existing redirect' do
    it 'updates and redirect to #index' 

  end

  describe '#destroy a redirect' do
    before do
      @test_id = create(:redirect).id
      expect(Redirect.find(@test_id)).not_to be_nil
    end

    it 'redirects to index' 


    it 'noes longer exist' 

  end
end

