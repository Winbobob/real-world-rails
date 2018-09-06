require 'spec_helper'


describe Api::V0::PaymentsController do
  describe '#index' do
    let(:settings) { create(:settings) }
    let!(:api_key) { settings.api_key }

    let(:campaign) { create(:campaign) }
    let!(:first_payment) { create(:payment, campaign: campaign) }

    def api_params(params={})
      {campaign_id: campaign.id, api_key: api_key}.merge(params)
    end

    subject { get :index, api_params }

    before do
      PaymentSerializer.should_receive(:new).with(first_payment, anything)
      .and_return(double("serializer", serializable_hash: {payment: 1}))
    end

    context 'for multiple records' do
      let!(:second_payment) { create(:payment, campaign: campaign) }
      before do

        PaymentSerializer.should_receive(:new).with(second_payment, anything)
        .and_return(double("serializer", serializable_hash: {payment: 2}))

      end
      it 'lists ALL of the payments for the campaign' 

      context 'ordering' do
        let(:order) { '' }
        let(:order_by) { 'created_at' }

        subject { get :index, api_params(order_direction: order, order_by: order_by) }

        it 'defaults to descending' 


        context 'ascending' do
          let(:order) { 'asc' }

          it 'respects the sort order' 

        end

        context 'descending' do
          let(:order) { 'desc' }

          it 'respects the sort order' 

        end
        
        context 'when ordering by a fake column' do
          let(:order_by) { 'foobar' }
          
          it 'returns the default order' 

        end
      end
    end

    context 'limiting' do
      let(:limit) { 1 }

      subject { get :index, api_params(limit: limit) }

      it 'limits the objects returned' 

    end
  end
end
  

