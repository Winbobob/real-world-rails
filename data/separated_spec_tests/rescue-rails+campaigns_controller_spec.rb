require 'rails_helper'

describe CampaignsController, type: :controller do
  describe 'GET #index' do
    it 'is successful' 

  end

  describe 'GET #show' do
    let(:campaign) { create(:campaign) }

    it 'is successful with valid id param' 


    it 'is unsuccessful with invalid id param' 

  end

  describe 'GET #new' do
    include_context 'signed in event manager'

    it 'is successful' 

  end

  describe 'GET #edit' do
    include_context 'signed in event manager'

    let(:campaign) { create(:campaign) }

    it 'is successful' 

  end

  describe 'PUT #update' do
    include_context 'signed in event manager'

    let(:campaign) { create(:campaign) }

    it 'is successful' 

  end

  describe 'POST #create' do
    include_context 'signed in event manager'

    it 'is successful' 

  end

end

