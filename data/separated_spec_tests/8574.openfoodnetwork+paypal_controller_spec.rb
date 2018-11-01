require 'spec_helper'

module Spree
  describe PaypalController, type: :controller do
    context 'when cancelling' do
      it 'redirects back to checkout' 

    end

    context 'when confirming' do
      let(:previous_order) { controller.current_order(true) }
      let(:payment_method) { create(:payment_method) }

      before do
        allow(previous_order).to receive(:complete?).and_return(true)
      end

      it 'resets the order' 


      it 'sets the access token of the session' 

    end

    describe '#expire_current_order' do
      it 'empties the order_id of the session' 


      it 'resets the @current_order ivar' 

    end
  end
end

