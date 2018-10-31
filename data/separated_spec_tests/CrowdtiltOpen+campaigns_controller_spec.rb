require 'spec_helper'

describe Api::V0::CampaignsController do
  let(:settings) { create(:settings) }
  let!(:api_key) { settings.api_key }

  let(:campaign) { create(:campaign) }
  let!(:reward) { create(:reward, campaign: campaign) }

  describe '#show' do
    subject { get :show, id: campaign.id, api_key: api_key }

    it 'includes the campaign rewards' 

  end
end

