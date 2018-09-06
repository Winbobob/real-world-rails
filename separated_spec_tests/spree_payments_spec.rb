require 'spec_helper'

describe 'Payments', type: :feature, js: true do
  stub_authorization!

  context 'with a pre-existing payment' do
    let!(:payment) do
      create(:payment,
             order:          order,
             amount:         order.outstanding_balance,
             payment_method: create(:credit_card_payment_method),
             state:          state)
    end

    let(:order) { create(:completed_order_with_totals, number: 'R100', line_items_count: 5) }
    let(:state) { 'checkout' }

    before do
      visit spree.edit_admin_order_path(order)
      click_link 'Payments'
    end

    def refresh_page
      visit current_path
    end

    # Regression tests for #1453
    context 'with a check payment' do
      let(:order) { create(:completed_order_with_totals, number: 'R100') }

      let!(:payment) do
        create(:payment,
               order: order,
               amount: order.outstanding_balance,
               payment_method: create(:check_payment_method)) # Check
      end

      it 'capturing a check payment from a new order' 


      it 'voids a check payment from a new order' 

    end

    it 'lists all captures for a payment' 


    it 'lists and create payments for an order' 


    # Regression test for #1269
    it 'cannot create a payment for an order with no payment methods', js: false do
      Spree::PaymentMethod.delete_all
      order.payments.delete_all

      click_on 'New Payment'
      expect(page).to have_content('You cannot create a payment for an order without any payment methods defined.')
      expect(page).to have_content('Please define some payment methods first.')
    end

    %w[checkout pending].each do |state|
      context "payment is #{state.inspect}" do
        let(:state) { state }

        it 'allows the amount to be edited by clicking on the edit button then saving' 


        it 'allows the amount to be edited by clicking on the amount then saving' 


        it 'allows the amount change to be cancelled by clicking on the cancel button' 


        it 'displays an error when the amount is invalid' 

      end
    end

    context 'payment is completed', js: false do
      let(:state) { 'completed' }

      it 'does not allow the amount to be edited' 

    end
  end

  context 'with no prior payments' do
    let(:order) { create(:order_with_line_items, line_items_count: 1) }
    let!(:payment_method) { create(:credit_card_payment_method) }

    # Regression tests for #4129
    context 'with a credit card payment method' do
      before do
        visit spree.admin_order_payments_path(order)
      end

      it 'is able to create a new credit card payment with valid information' 


      it 'is unable to create a new payment with invalid information' 

    end

    context 'user existing card' do
      let!(:cc) do
        create(:credit_card, user_id: order.user_id, payment_method: payment_method, gateway_customer_profile_id: 'BGS-RFRE')
      end

      before { visit spree.admin_order_payments_path(order) }

      it 'is able to reuse customer payment source', js: false do
        expect(find("#card_#{cc.id}")).to be_checked
        click_button 'Continue'
        expect(page).to have_content('Payment has been successfully created!')
      end
    end

    context 'with a check' do
      let!(:payment_method) { create(:check_payment_method) }

      before do
        visit spree.admin_order_payments_path(order.reload)
      end

      it 'can successfully be created and captured' 

    end

    context 'store_credit payment' do
      let!(:payment_method) { create(:store_credit_payment_method) }
      let!(:category) { create(:store_credit_category, name: 'Default') }

      before do
        create(:store_credit, user: order.user, category: category, amount: 500)
        visit spree.new_admin_order_payment_path(order.reload)
        choose("payment_payment_method_id_#{payment_method.id}")
        click_button 'Continue'
      end

      it { expect(page).to have_content('successfully created') }
    end
  end
end

