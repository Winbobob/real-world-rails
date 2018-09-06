require 'spec_helper'

module Spree
  module Admin
    describe ReturnIndexController, type: :controller do
      stub_authorization!

      describe '#return_authorizations' do
        subject do
          spree_get :return_authorizations
        end

        let(:return_authorization) { create(:return_authorization) }

        before { subject }

        it 'loads return authorizations' 

      end

      describe '#customer_returns' do
        subject do
          spree_get :customer_returns
        end

        let(:customer_return) { create(:customer_return) }

        before { subject }

        it 'loads customer returns' 

      end
    end
  end
end

