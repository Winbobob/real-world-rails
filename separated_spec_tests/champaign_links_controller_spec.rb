# frozen_string_literal: true

require 'rails_helper'

describe LinksController do
  let(:link) { instance_double('Link', save: true) }

  include_examples 'session authentication'

  describe 'POST #create' do
    let(:page) { instance_double('Page') }
    let(:params) { { url: 'http://google.com', title: 'Google.com' } }

    before do
      allow(Page).to receive(:find) { page }
      allow(Link).to receive(:new) { link }

      post :create, params: { page_id: '1', link: params }
    end

    it 'authenticates session' 


    it 'does not bother to find page' 


    it 'creates link' 


    it 'saves link' 


    context 'successfully created' do
      it 'renders link partial' 

    end
  end

  describe 'DELETE #destroy' do
    before do
      allow(Link).to receive(:find) { link }
      allow(link).to receive(:destroy)

      delete :destroy, params: { page_id: '1', id: '2', format: :json }
    end

    it 'finds link' 


    it 'destroys link' 

  end
end

