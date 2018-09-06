# frozen_string_literal: true

require 'spec_helper'

module Spree
  class GatewayWithPassword < PaymentMethod
    preference :password, :string, default: "password"
  end

  describe Admin::PaymentMethodsController, type: :controller do
    stub_authorization!

    context "GatewayWithPassword" do
      let(:payment_method) { GatewayWithPassword.create!(name: "Bogus", preferred_password: "haxme") }

      before do
        allow(Rails.application.config.spree).to receive(:payment_methods).and_return([GatewayWithPassword])
      end

      # regression test for https://github.com/spree/spree/issues/2094
      it "does not clear password on update" 

    end

    context "tries to save invalid payment" do
      it "doesn't break, responds nicely" 

    end

    it "can create a payment method of a valid type" 


    it "can not create a payment method of an invalid type" 


    describe "GET index" do
      subject { get :index }

      let!(:first_method) { GatewayWithPassword.create! name: "First", preferred_password: "1235" }
      let!(:second_method) { GatewayWithPassword.create! name: "Second", preferred_password: "1235" }

      before do
        second_method.move_to_top
      end

      it { is_expected.to be_successful }
      it { is_expected.to render_template "index"  }

      it "respects the order of payment methods by position" 

    end
  end
end
