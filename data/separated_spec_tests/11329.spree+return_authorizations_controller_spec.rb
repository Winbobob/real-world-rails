require 'spec_helper'

module Spree
  describe Api::V1::ReturnAuthorizationsController, type: :controller do
    render_views

    let!(:order) { create(:shipped_order) }

    let(:product) { create(:product) }
    let(:attributes) { [:id, :memo, :state] }
    let(:resource_scoping) { { order_id: order.to_param } }

    before do
      stub_authentication!
    end

    context 'as the order owner' do
      before do
        allow_any_instance_of(Order).to receive_messages user: current_api_user
      end

      it 'cannot see any return authorizations' 


      it 'cannot see a single return authorization' 


      it 'cannot learn how to create a new return authorization' 


      it 'cannot create a new return authorization' 


      it 'cannot update a return authorization' 


      it 'cannot delete a return authorization' 

    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'can show return authorization' 


      it 'can get a list of return authorizations' 


      it 'can control the page size through a parameter' 


      it 'can query the results through a paramter' 


      it 'can learn how to create a new return authorization' 


      it 'can update a return authorization on the order' 


      it 'can cancel a return authorization on the order' 


      it 'can delete a return authorization on the order' 


      it 'can add a new return authorization to an existing order' 

    end

    context 'as just another user' do
      it 'cannot add a return authorization to the order' 


      it 'cannot update a return authorization on the order' 


      it 'cannot delete a return authorization on the order' 

    end
  end
end

