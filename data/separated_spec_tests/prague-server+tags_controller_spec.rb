require 'spec_helper'

describe Api::TagsController do
  render_views

  let(:organization) { create(:organization) }
  let(:token) { double :accessible? => true, :acceptable? => true, resource_owner_id: organization.id }

  before do
    allow(controller).to receive(:doorkeeper_token) {token}
  end

  let!(:tag) { create(:tag, name: 'foo', organization: organization) }

  describe 'index' do
    it 'responds with 200' 

  end

  describe 'show' do
    it 'responds with 200' 


    it 'should include the display amount for the total' 


    it 'should include the base and display average charge amount' 

  end


  describe 'history' do
    it 'responds with 200' 


    it 'should include historical data' 

  end
end

