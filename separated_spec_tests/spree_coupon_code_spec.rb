require 'spec_helper'

describe 'Coupon code promotions', type: :feature, js: true do
  let!(:country) { create(:country, name: 'United States of America', states_required: true) }
  let!(:state) { create(:state, name: 'Alabama', country: country) }

  before do
    create(:zone)
    create(:shipping_method)
    create(:check_payment_method)
    create(:product, name: 'RoR Mug', price: 20)
    create(:store)
  end

  context 'visitor makes checkout as guest without registration' do
    def create_basic_coupon_promotion(code)
      promotion = Spree::Promotion.create!(name:       code.titleize,
                                           code:       code,
                                           starts_at:  1.day.ago,
                                           expires_at: 1.day.from_now)

      calculator = Spree::Calculator::FlatRate.new
      calculator.preferred_amount = 10

      action = Spree::Promotion::Actions::CreateItemAdjustments.new
      action.calculator = calculator
      action.promotion = promotion
      action.save

      promotion.reload # so that promotion.actions is available
    end

    let!(:promotion) { create_basic_coupon_promotion('onetwo') }

    # OrdersController
    context 'on the payment page' do
      before do
        visit spree.root_path
        click_link 'RoR Mug'
        click_button 'add-to-cart-button'
        click_button 'Checkout'
        fill_in 'order_email', with: 'spree@example.com'
        fill_in 'First Name', with: 'John'
        fill_in 'Last Name', with: 'Smith'
        fill_in 'Street Address', with: '1 John Street'
        fill_in 'City', with: 'City of John'
        fill_in 'Zip', with: '01337'
        select country.name, from: 'Country'
        select state.name, from: 'order[bill_address_attributes][state_id]'
        fill_in 'Phone', with: '555-555-5555'

        # To shipping method screen
        click_button 'Save and Continue'
        # To payment screen
        click_button 'Save and Continue'
      end

      it 'informs about an invalid coupon code' 


      it 'informs the user about a coupon code which has exceeded its usage' 


      it 'can enter an invalid coupon code, then a real one' 


      context 'with a promotion' do
        it 'applies a promotion to an order' 

      end
    end
  end
end

