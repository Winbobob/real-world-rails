# frozen_string_literal: true

require 'spec_helper'

describe Spree::OrdersController, type: :controller do
  let!(:store) { create(:store) }
  let(:user) { create(:user) }

  context "Order model mock" do
    let(:order) do
      Spree::Order.create!
    end
    let(:variant) { create(:variant) }

    before do
      allow(controller).to receive_messages(try_spree_current_user: user)
    end

    context "#populate" do
      it "should create a new order when none specified" 


      context "with Variant" do
        it "should handle population" 


        it "shows an error when population fails" 


        it "shows an error when quantity is invalid" 


        context "when quantity is empty string" do
          it "should populate order with 1 of given variant" 

        end

        context "when quantity is nil" do
          it "should populate order with 1 of given variant" 

        end
      end
    end

    context "#update" do
      context "with authorization" do
        before do
          allow(controller).to receive :authorize!
          allow(controller).to receive_messages current_order: order
        end

        it "should render the edit view (on failure)" 


        it "should redirect to cart path (on success)" 


        it "should advance the order if :checkout button is pressed" 


        context 'trying to apply a coupon code' do
          let(:order) { create(:order_with_line_items, state: 'cart') }
          let(:coupon_code) { "coupon_code" }

          context "when coupon code is empty" do
            let(:coupon_code) { "" }

            it 'does not try to apply coupon code' 

          end

          context "when coupon code is applied" do
            let(:promotion_handler) { instance_double('Spree::PromotionHandler::Coupon', error: nil, success: 'Coupon Applied!') }

            it "continues checkout flow normally" 


            context "when coupon code is not applied" do
              let(:promotion_handler) { instance_double('Spree::PromotionHandler::Coupon', error: 'Some error', success: false) }

              it "render cart with coupon error" 

            end
          end
        end
      end
    end

    context "#empty" do
      before do
        allow(controller).to receive :authorize!
      end

      it "should destroy line items in the current order" 

    end

    # Regression test for https://github.com/spree/spree/issues/2750
    context "#update" do
      before do
        allow(user).to receive :last_incomplete_spree_order
        allow(controller).to receive :set_current_order
      end

      it "cannot update a blank order" 

    end
  end

  context "line items quantity is 0" do
    let(:order) { Spree::Order.create(store: store) }
    let(:variant) { create(:variant) }
    let!(:line_item) { order.contents.add(variant, 1) }

    before do
      allow(controller).to receive :authorize!
      allow(controller).to receive_messages(current_order: order)
    end

    it "removes line items on update" 

  end
end

