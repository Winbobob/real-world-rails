require 'spec_helper'

describe 'New Order', type: :feature do
  let!(:product) { create(:product_in_stock) }
  let!(:state) { create(:state) }
  let!(:user) { create(:user, ship_address: create(:address), bill_address: create(:address)) }

  stub_authorization!

  before do
    create(:check_payment_method)
    create(:shipping_method)
    # create default store
    allow(Spree.user_class).to receive(:find_by).and_return(user)
    create(:store)
    visit spree.new_admin_order_path
  end

  it 'does check if you have a billing address before letting you add shipments' 


  it 'completes new order successfully without using the cart', js: true do
    select2_search product.name, from: Spree.t(:name_or_sku)
    click_icon :add
    wait_for_ajax
    click_on 'Customer'
    select_customer

    check 'order_use_billing'
    fill_in_address
    click_on 'Update'

    click_on 'Payments'
    click_on 'Update'

    expect(page).to have_current_path(spree.admin_order_payments_path(Spree::Order.last))
    click_icon 'capture'

    click_on 'Shipments'
    click_on 'Ship'
    wait_for_ajax

    expect(page).to have_content('shipped')
  end

  context 'adding new item to the order', js: true do
    it 'inventory items show up just fine and are also registered as shipments' 

  end

  context "adding new item to the order which isn't available", js: true do
    before do
      product.update(available_on: nil)
      select2_search product.name, from: Spree.t(:name_or_sku)
    end

    it 'inventory items is displayed' 


    context 'on increase in quantity the product should be removed from order', js: true do
      before do
        spree_accept_alert do
          within('table.stock-levels') do
            fill_in 'variant_quantity', with: 2
            click_icon :add
            wait_for_ajax
          end
        end
      end

      it { expect(page).not_to have_css('#stock_details') }
    end
  end

  # Regression test for #3958
  context 'without a delivery step', js: true do
    before do
      allow(Spree::Order).to receive_messages checkout_step_names: [:address, :payment, :confirm, :complete]
    end

    it 'can still see line items' 

  end

  # Regression test for #3336
  context 'start by customer address' do
    it 'completes order fine', js: true do
      click_on 'Customer'
      select_customer

      check 'order_use_billing'
      fill_in_address
      click_on 'Update'

      click_on 'Shipments'
      select2_search product.name, from: Spree.t(:name_or_sku)
      click_icon :add
      wait_for_ajax

      click_on 'Payments'
      click_on 'Continue'

      within('.additional-info .state') do
        expect(page).to have_content('complete')
      end
    end
  end

  # Regression test for #5327
  context 'customer with default credit card', js: true do
    before do
      allow(Spree.user_class).to receive(:find_by).and_return(user)
      create(:credit_card, default: true, user: user)
    end
    it 'transitions to delivery not to complete' 

  end

  def fill_in_address(kind = 'bill')
    fill_in 'First Name',                with: 'John 99'
    fill_in 'Last Name',                 with: 'Doe'
    fill_in 'Street Address',            with: '100 first lane'
    fill_in "Street Address (cont'd)",   with: '#101'
    fill_in 'City',                      with: 'Bethesda'
    fill_in 'Zip',                       with: '20170'
    targetted_select2_search state.name, from: "#s2id_order_#{kind}_address_attributes_state_id"
    fill_in 'Phone',                     with: '123-456-7890'
  end

  def select_customer
    within 'div#select-customer' do
      targetted_select2_search user.email, from: '#s2id_customer_search'
    end
  end
end

