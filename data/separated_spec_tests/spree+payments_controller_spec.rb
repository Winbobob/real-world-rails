require 'spec_helper'

module Spree
  describe Api::V1::PaymentsController, type: :controller do
    render_views
    let!(:order) { create(:order) }
    let!(:payment) { create(:payment, order: order) }
    let!(:attributes) do
      [:id, :source_type, :source_id, :amount, :display_amount,
       :payment_method_id, :state, :avs_response,
       :created_at, :updated_at, :number]
    end

    let(:resource_scoping) { { order_id: order.to_param } }

    before do
      stub_authentication!
    end

    context 'as a user' do
      context 'when the order belongs to the user' do
        before do
          allow_any_instance_of(Order).to receive_messages user: current_api_user
        end

        it 'can view the payments for their order' 


        it 'can learn how to create a new payment' 


        it 'can create a new payment' 


        it "can view a pre-existing payment's details" 


        it 'cannot update a payment' 


        it 'cannot authorize a payment' 

      end

      context 'when the order does not belong to the user' do
        before do
          allow_any_instance_of(Order).to receive_messages user: stub_model(LegacyUser)
        end

        it "cannot view payments for somebody else's order" 


        it 'can view the payments for an order given the order token' 

      end
    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'can view the payments on any order' 


      context 'multiple payments' do
        before { @payment = create(:payment, order: order) }

        it 'can view all payments on an order' 


        it 'can control the page size through a parameter' 

      end

      context 'for a given payment' do
        context 'updating' do
          context 'when the state is checkout' do
            it 'can update' 

          end

          context 'when the state is pending' do
            it 'can update' 

          end

          context 'update fails' do
            it 'returns a 422 status when the amount is invalid' 


            it 'returns a 403 status when the payment is not pending' 

          end
        end

        context 'authorizing' do
          it 'can authorize' 


          context 'authorization fails' do
            before do
              fake_response = double(success?: false, to_s: 'Could not authorize card')
              expect_any_instance_of(Spree::Gateway::Bogus).to receive(:authorize).and_return(fake_response)
              api_put :authorize, id: payment.to_param
            end

            it 'returns a 422 status' 


            it 'does not raise a stack level error' 

          end
        end

        context 'capturing' do
          it 'can capture' 


          context 'capturing fails' do
            before do
              fake_response = double(success?: false, to_s: 'Insufficient funds')
              expect_any_instance_of(Spree::Gateway::Bogus).to receive(:capture).and_return(fake_response)
            end

            it 'returns a 422 status' 

          end
        end

        context 'purchasing' do
          it 'can purchase' 


          context 'purchasing fails' do
            before do
              fake_response = double(success?: false, to_s: 'Insufficient funds')
              expect_any_instance_of(Spree::Gateway::Bogus).to receive(:purchase).and_return(fake_response)
            end

            it 'returns a 422 status' 

          end
        end

        context 'voiding' do
          it 'can void' 


          context 'voiding fails' do
            before do
              fake_response = double(success?: false, to_s: 'NO REFUNDS')
              expect_any_instance_of(Spree::Gateway::Bogus).to receive(:void).and_return(fake_response)
            end

            it 'returns a 422 status' 

          end
        end
      end
    end
  end
end

