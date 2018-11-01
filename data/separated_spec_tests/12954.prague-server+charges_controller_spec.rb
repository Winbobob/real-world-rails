require 'spec_helper'

describe Org::ChargesController do
  describe 'index' do
    let(:organization) { create(:organization) }
    let(:user) { create(:confirmed_user, organization: organization)}

    before(:each) do
      allow(controller).to receive(:current_organization).and_return( organization )
      sign_in user
      get :index, params: { organization_id: organization }
    end

    it 'should return a list of charges' 


    context 'with a charge in the organization' do
      let!(:charge) { create(:charge, organization: organization) }

      it 'should return a list of charges' 

    end
  end
end

