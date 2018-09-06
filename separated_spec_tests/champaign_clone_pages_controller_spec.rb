# frozen_string_literal: true

require 'rails_helper'

describe ClonePagesController do
  let(:page) { double }
  let(:user) { double }

  before do
    allow(Page).to receive(:find) { page }
    allow(request.env['warden']).to receive(:authenticate!) { user }
  end

  describe 'GET #new' do
    before do
      get :new, params: { id: '1' }
    end

    it 'authenticates session' 


    it 'finds page' 


    it 'assigns page' 


    it 'renders new' 

  end

  describe 'POST #create' do
    let(:cloned_page) { build('page', slug: 'foo-bar') }

    before do
      allow(PageCloner).to receive(:clone) { cloned_page }
      allow(QueueManager).to receive(:push)

      post :create, params: { id: '1', page: { title: 'foo', language_id: 3 }, override_forms: '1' }
    end

    it 'authenticates session' 


    it 'finds page' 


    it 'clones page' 


    it 'posts page to queue' 


    it 'redirects to cloned page' 

  end
end

