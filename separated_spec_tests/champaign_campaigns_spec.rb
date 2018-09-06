# frozen_string_literal: true

require 'rails_helper'

describe 'Campaigns', type: :request do
  before do
    login_as(create(:user), scope: :user)
  end

  describe '#create' do
    context 'given valid params' do
      let(:params) do
        { params: { campaign: { name: 'Super Campaign' } } }
      end

      it 'creates a new campaign' 


      it 'redirects to /campaigns' 


      it 'publishes the event' 

    end

    context 'given invalid params' do
      let(:params) do
        { params: { campaign: { name: '' } } }
      end

      it 'returns 422 Unprocessable Entity' 


      it 'displays an error message' 

    end
  end

  describe '#update' do
    let!(:campaign) { create(:campaign) }
    context 'given valid params' do
      let(:params) do
        { params: { campaign: { name: 'Updated Campaign' } } }
      end

      it 'updates the campaign' 


      it 'redirects to /campaigns' 


      it 'publishes the event' 

    end

    context 'given invalid params' do
      let(:params) do
        { params: { campaign: { name: '' } } }
      end

      it 'returns 422 Unprocessable Entity' 


      it 'displays an error message' 

    end
  end
end

