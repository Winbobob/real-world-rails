require 'spec_helper'

describe Api::NamespacesController do
  render_views

  let(:organization) { create(:organization) }
  let(:token) { double :accessible? => true, :acceptable? => true, resource_owner_id: organization.id }
  let!(:namespace) { create(:tag_namespace, namespace: 'foo', organization: organization) }

  before do
    allow(controller).to receive(:doorkeeper_token) {token}
  end

  describe 'show' do
    it 'responds with 200' 

  end

  describe 'history' do
    it 'responds with 200' 


    it 'should include historical data' 

  end

  describe 'index' do
    it 'responds with 200' 

  end

  describe 'raised' do
    let(:most_raised_tag) { create(:tag, organization: organization, namespace: namespace) }
    let(:second_most_raised_tag) { create(:tag, organization: organization, namespace: namespace) }

    before :each do
      most_raised_tag.incrby(1000)
      second_most_raised_tag.incrby(500)
    end

    it 'responds with 200' 


    it "returns top ranked tags" 

  end
end

