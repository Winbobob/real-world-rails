# frozen_string_literal: true

require 'rails_helper'

describe UrisController do
  let(:uri) { instance_double('Uri', save: true) }

  before do
    allow(Uri).to receive(:find) { uri }
  end

  include_examples 'session authentication'

  describe 'GET #index' do
    let(:uris) { [build(:uri), build(:uri)] }

    before :each do
      allow(Uri).to receive(:all).and_return(uris)
    end

    it 'assigns all uris as @uris' 

  end

  describe 'POST #create' do
    let(:params) { { domain: 'google.com', path: '/giddyup', page_id: '1' } }

    before do
      allow(Uri).to receive(:new) { uri }

      post :create, params: { uri: params }
    end

    it 'authenticates session' 


    it 'creates uri' 


    it 'saves uri' 


    context 'successfully created' do
      it 'renders uri partial' 

    end
  end

  describe 'DELETE #destroy' do
    before do
      allow(uri).to receive(:destroy)

      delete :destroy, params: { id: '2', format: :json }
    end

    it 'authenticates session' 


    it 'finds uri' 


    it 'destroys uri' 

  end
end

