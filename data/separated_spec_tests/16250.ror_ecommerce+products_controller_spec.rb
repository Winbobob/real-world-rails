require File.dirname(__FILE__) + '/../spec_helper'

describe ProductsController do
  render_views

  let(:user)             { FactoryGirl.create(:user) }
  let(:product)          { FactoryGirl.create(:product) }
  let!(:instock_variant) { FactoryGirl.create(:variant, product: product) }

  before(:each) do
    instock_variant.stubs(:primary_property).returns(nil)
    instock_variant.stubs(:properties).returns(nil)
    variant.stubs(:primary_property).returns(nil)
    variant.stubs(:properties).returns(nil)
    product.activate!
  end


  context 'instock variant' do
    let(:inventory) { FactoryGirl.create(:inventory, count_on_hand: 10000, count_pending_to_customer: 0) }
    let!(:variant)  { FactoryGirl.create(:variant, inventory: inventory, product: product) }

    it "index action should render index template" 


    it "show action should not blow up without a property association" 


    context 'when logged in' do
      before(:each) do
        activate_authlogic
        login_as(user)
      end

      it "index action should render index template" 


      it "show action should not blow up without a property association" 

    end
  end

  context 'out of stock variant' do
    let(:inventory)        { FactoryGirl.create(:inventory, count_on_hand: 10, count_pending_to_customer: 10) }
    let!(:variant)         { FactoryGirl.create(:variant, inventory: inventory, product: product) }

    it "index action should render index template" 


    it "show action should not blow up without variant sold out" 


    context 'when logged in' do
      before(:each) do
        activate_authlogic
        login_as(user)
      end

      it "index action should render index template" 


      it "show action should not blow up without variant sold out" 

    end
  end
end

