require 'spec_helper'
require 'spree/api/testing_support/helpers'

module OpenFoodNetwork
  describe CartController, type: :controller do
    render_views

    let(:user) { FactoryBot.create(:user) }
    let(:product1) do
      p1 = FactoryBot.create(:product)
      p1.update_column(:count_on_hand, 10)
      p1
    end
    let(:cart) { Cart.create(user: user) }
    let(:distributor) { FactoryBot.create(:distributor_enterprise) }

    before do
    end

    context "as a normal user" do

      context 'with an existing cart' do

        it "retrieves an empty cart" 


        context 'with an empty order' do
          let(:order) { FactoryBot.create(:order, distributor: distributor) }

          before(:each) do
            cart.orders << order
            cart.save!
          end

          it "retrieves a cart with a single order and line item" 

        end

        context 'an order with line items' do
          let(:product) { FactoryBot.create(:product, distributors: [ distributor ]) }
          let(:order) { FactoryBot.create(:order, { distributor: distributor } ) }
          let(:line_item) { FactoryBot.create(:line_item, { variant: product.master }) }

          before(:each) do
            order.line_items << line_item
            order.save
            cart.orders << order
            cart.save!
          end

          it "retrieves a cart with a single order and line item" 

        end

        context 'adding a variant' do

          it 'should add variant to new order and return the order' 

        end
      end
    end
  end
end

