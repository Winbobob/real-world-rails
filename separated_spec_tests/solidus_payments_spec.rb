# frozen_string_literal: true

require 'spec_helper'

describe 'Payments', type: :feature do
  stub_authorization!

  context "with a pre-existing payment" do
    let!(:payment) do
      create(:payment,
        order:          order,
        amount:         order.outstanding_balance,
        payment_method: create(:credit_card_payment_method),
        state:          state)
    end

    let(:order) { create(:completed_order_with_totals, number: 'R100', line_items_price: 50) }
    let(:state) { 'checkout' }

    before do
      visit "/admin/orders/#{order.number}/payments"
    end

    # Regression tests for https://github.com/spree/spree/issues/1453
    context 'with a check payment' do
      let(:order) { create(:completed_order_with_totals, number: 'R100') }
      let!(:payment) do
        create(:payment,
          order:          order,
          amount:         order.outstanding_balance,
          payment_method: create(:check_payment_method, available_to_admin: true)) # Check
      end

      it 'capturing a check payment from a new order' 


      it 'voids a check payment from a new order' 

    end

    it 'should list all captures for a payment' 


    it 'displays the address for a credit card when present' 


    it 'lists, updates and creates payments for an order', js: true do
      within_row(1) do
        expect(column_text(3)).to eq('Credit Card')
        expect(column_text(5)).to eq('Checkout')
        expect(column_text(6)).to have_content('$150.00')
      end

      click_icon :void
      expect(page).to have_css('#payment_status', text: 'Balance due')
      expect(page).to have_content('Payment Updated')

      within_row(1) do
        expect(column_text(5)).to eq('Void')
      end

      click_on 'New Payment'
      expect(page).to have_content('New Payment')
      click_button 'Update'
      expect(page).to have_content('successfully created!')

      click_icon(:capture)

      expect(page).to have_selector('#payment_status', text: 'Paid')
      expect(page).not_to have_selector('#new_payment_section')
    end

    # Regression test for https://github.com/spree/spree/issues/1269
    it 'cannot create a payment for an order with no payment methods' 


    context 'payment is pending', js: true do
      let(:state) { 'pending' }

      it 'allows the amount to be edited by clicking on the edit button then saving' 


      it 'allows the amount change to be cancelled by clicking on the cancel button' 


      it 'displays an error when the amount is invalid' 

    end

    context 'payment is completed', js: true do
      let(:state) { 'completed' }

      it 'does not allow the amount to be edited' 

    end
  end

  context "with no prior payments" do
    let(:order) { create(:order_with_line_items, line_items_count: 1) }
    let!(:payment_method) { create(:credit_card_payment_method) }

    # Regression tests for https://github.com/spree/spree/issues/4129
    context "with a credit card payment method" do
      before do
        visit spree.admin_order_payments_path(order)
      end

      it "is able to create a new credit card payment with valid information", js: true do
        fill_in "Card Number", with: "4111 1111 1111 1111"
        fill_in "Name", with: "Test User"
        fill_in "Expiration", with: "09 / #{Time.current.year + 1}"
        fill_in "Card Code", with: "007"
        # Regression test for https://github.com/spree/spree/issues/4277
        expect(page).to have_css('.ccType[value="visa"]', visible: false)
        click_button "Continue"
        expect(page).to have_content("Payment has been successfully created!")
      end

      it "is unable to create a new payment with invalid information" 

    end

    context "user existing card" do
      let!(:cc) do
        create(:credit_card, payment_method: payment_method, gateway_customer_profile_id: "BGS-RFRE")
      end

      before do
        order.user.wallet.add(cc)
        visit spree.admin_order_payments_path(order)
      end

      it "is able to reuse customer payment source" 

    end

    context "with a check" do
      let(:order) { create(:completed_order_with_totals, line_items_count: 1) }
      let!(:payment_method) { create(:check_payment_method) }

      before do
        visit spree.admin_order_payments_path(order.reload)
      end

      it "can successfully be created and captured" 

    end

    context 'with a soft-deleted payment method' do
      let(:order) { create(:completed_order_with_totals, line_items_count: 1) }
      let!(:payment_method) { create(:check_payment_method) }
      let!(:payment) do
        create(:payment,
          order:          order,
          amount:         order.outstanding_balance,
          payment_method: payment_method)
      end

      before do
        payment_method.discard
        visit spree.admin_order_payments_path(order.reload)
      end

      it "can list and view the payment" 

    end
  end

  # Previously this would fail unless the method was named "Credit Card"
  context "with an differently named payment method" do
    let(:order) { create(:order_with_line_items, line_items_count: 1) }
    let!(:chequing_payment_method) { create(:check_payment_method) }
    let!(:payment_method) { create(:credit_card_payment_method, name: "Multipass!") }

    before do
      visit spree.admin_order_payments_path(order.reload)
    end

    it "is able to create a new payment", js: true do
      choose payment_method.name
      fill_in "Card Number", with: "4111 1111 1111 1111"
      fill_in "Name", with: "Test User"
      fill_in "Expiration", with: "09 / #{Time.current.year + 1}"
      fill_in "Card Code", with: "007"
      click_button "Continue"
      expect(page).to have_content("Payment has been successfully created!")
    end
  end

  context "when required quantity is more than available" do
    let(:product) { create(:product_not_backorderable) }

    let(:order) do
      create(:order_with_line_items, {
        line_items_count: 1,
        line_items_attributes: [{ quantity: 11, product: product }],
        stock_location: product.master.stock_locations.first
      })
    end

    let!(:chequing_payment_method) { create(:check_payment_method) }
    let!(:payment_method) { create(:credit_card_payment_method, name: "Multipass!") }

    before do
      visit spree.admin_order_payments_path(order.reload)
    end

    it "displays an error" 

  end
end

