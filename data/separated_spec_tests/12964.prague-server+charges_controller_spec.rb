require 'spec_helper'

describe Api::Tags::ChargesController do
  render_views

  let(:token) { double :accessible? => true, :acceptable? => true, resource_owner_id: organization.id }

  before do
    allow(controller).to receive(:doorkeeper_token) {token}
  end

  let(:organization) { create(:organization) }
  let!(:tag) { create(:tag, name: 'foo', organization: organization) }
  let!(:charge) { create(:charge, organization: organization, paid: true)}

  describe 'index' do
    before(:each) do
      charge.tags << tag
    end

    it 'should get a list of charges in the namespace' 


    it 'should include the display amount' 


    it 'should include the list of all tags for each charge' 


    it 'should include the stripe dashboard url' 


    context 'charge is in a different currency' do
      let!(:charge) { create(:charge, currency: 'GBP', organization: organization, paid: true)}

      it 'should include the displayable converted amount in the org currency' 

    end
  end
end

