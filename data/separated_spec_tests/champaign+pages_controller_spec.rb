# frozen_string_literal: true

require 'rails_helper'

describe Api::PagesController do
  let(:page) { instance_double('Page', id: 1, to_param: '1', to_json: '') }
  let(:page_updater) { double(update: true, refresh?: true) }

  before do
    allow(Page).to receive(:find) { page }
  end

  describe 'GET index' do
    before do
      allow(PageService).to receive(:list)
      get :index, params: { language: 'en', format: :json }
    end

    it 'gets list of pages' 


    it 'responds with json' 

  end

  describe 'GET featured' do
    before do
      allow(PageService).to receive(:list_featured)
      get :featured, params: { language: 'en', format: :json }
    end

    it 'gets list of pages' 


    it 'responds with json' 

  end

  describe 'PUT update' do
    it 'is redirected if the user is not logged in' 


    context 'logged in' do
      before do
        allow(PageUpdater).to receive(:new).and_return(page_updater)
        allow(request.env['warden']).to receive(:authenticate!) { double }
        put :update, params: { id: 1 }
      end

      it 'finds page' 


      it 'returns success' 


      describe 'PageUpdater' do
        it 'is instantiated' 


        it 'calls update with params' 

      end
    end
  end

  describe 'GET show' do
    context 'for existing page' do
      before { get :show, params: { id: '2', format: 'json' } }

      it 'finds page' 


      it 'renders json' 

    end

    context 'record not found' do
      before do
        allow(Page).to receive(:find) { raise ActiveRecord::RecordNotFound }
        get :show, params: { id: '2' }
      end

      it 'renders json' 

    end
  end

  describe 'GET actions' do
    subject { get :actions, params: { id: '2' } }

    it 'returns a 403 if the page publish_actions is secure' 


    it 'calls ActionReader if page publish_actions is default_hidden' 

  end
end

