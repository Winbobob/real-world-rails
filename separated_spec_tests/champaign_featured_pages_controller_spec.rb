# frozen_string_literal: true

require 'rails_helper'

describe FeaturedPagesController do
  let(:page) { double('Page') }

  include_examples 'session authentication',
                   [{ post:   [:create, params: { format: :js }] },
                    { delete: [:destroy, params: { id: '1', format: :js }] }]

  before do
    allow(Page).to receive(:find) { page }
    allow(page).to receive(:update)
  end

  describe 'POST #create' do
    before do
      post :create, params: { id: '1', format: :js }
    end

    it 'finds page' 


    it 'sets page#featured to true' 


    it 'renders show template' 

  end

  describe 'DELETE #destroy' do
    before do
      delete :destroy, params: { id: '1', format: :js }
    end

    it 'finds page' 


    it 'sets page#featured to false' 


    it 'renders show template' 

  end
end

