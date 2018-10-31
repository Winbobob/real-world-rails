require 'spec_helper'

describe Api::WebhookEndpointsController do
  render_views

  let(:organization) { create(:organization) }
  let(:token) { double :accessible? => true, :acceptable? => true, resource_owner_id: organization.id }

  before do
    allow(controller).to receive(:doorkeeper_token) {token}
  end

  describe '#index' do
    let!(:webhook_endpoint) { create(:webhook_endpoint, organization: organization) }

    it 'should let you get the webhooks' 

  end

  describe '#create' do
    it 'should allow creation of webhook endpoints' 


    it 'should not allow creation of invalid webhook endpoints' 

  end

  describe '#destroy' do
    let(:webhook_endpoint) { create(:webhook_endpoint, organization: organization) }

    it 'should allow deletes of endpoints' 

  end
end

