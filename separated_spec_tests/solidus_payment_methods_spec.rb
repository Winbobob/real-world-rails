# frozen_string_literal: true

require 'spec_helper'

describe "Payment Methods", type: :feature do
  stub_authorization!

  before(:each) do
    visit spree.admin_path
    click_link "Settings"
  end

  context "admin visiting payment methods listing page" do
    before do
      create(:check_payment_method)
    end

    it "should display existing payment methods" 

  end

  context "admin creating a new payment method" do
    it "should be able to create a new payment method" 

  end

  context "admin editing a payment method" do
    let!(:payment_method) { create(:check_payment_method) }

    before do
      click_link "Payments"
      expect(page).to have_link 'Payment Methods'
      within("table#listing_payment_methods") do
        click_icon(:edit)
      end
    end

    it "should be able to edit an existing payment method" 


    context "with multiple stores available" do
      before do
        create(:store, name: "Default Store", url: "spreestore.example.com")
        visit current_path
      end

      it "should be able to change the associated stores" 

    end

    it "should display validation errors" 


    context 'with payment method having hash and array as preference' do
      class ComplexPayments < Spree::PaymentMethod
        preference :name, :string
        preference :mapping, :hash
        preference :recipients, :array
      end

      let!(:payment_method) { ComplexPayments.create!(name: 'Complex Payments') }

      it "does not display preference fields that are hash or array" 

    end
  end

  context "changing type and payment_source", js: true do
    before do
      create(:credit_card_payment_method)
    end

    it "displays message when changing type" 


    it "displays message when changing preference source" 


    it "updates successfully and keeps secrets" 


    after do
      # cleanup
      Spree::Config.static_model_preferences.for_class(Spree::PaymentMethod::BogusCreditCard).clear
    end
  end
end

