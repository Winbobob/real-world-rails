require 'spec_helper'

describe Api::V0::BaseController do
  controller do
    def index
      head :ok
    end

    def show
      raise ActiveRecord::RecordNotFound
    end
  end

  let(:settings) { create(:settings) }
  let(:api_key) { settings.api_key }

  describe '#authenticate_api!' do
    subject { get :index, api_key: api_key }

    context 'when the requester is not authenticated' do
      let(:api_key) { nil }

      it 'renders an unauthorized response' 

    end

    context 'when the requester is authenticated' do
      it 'allows the request to continue' 

    end
  end

  describe 'rescuing from record not found' do
    subject { get :show, id: 1, api_key: api_key }

    it 'heads not found' 

  end
end

