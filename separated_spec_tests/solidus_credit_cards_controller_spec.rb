# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::CreditCardsController, type: :request do
    describe '#index' do
      let!(:admin_user) do
        create(:admin_user)
      end

      let!(:normal_user) do
        create(:user, :with_api_key)
      end

      let!(:card) { create(:credit_card, user_id: admin_user.id, gateway_customer_profile_id: "random") }

      before do
        stub_authentication!
      end

      it "the user id doesn't exist" 


      context "calling user is in admin role" do
        let(:current_api_user) do
          admin_user
        end

        it "no credit cards exist for user" 


        it "can view all credit cards for user" 

      end

      context "calling user is not in admin role" do
        let(:current_api_user) do
          normal_user
        end

        let!(:card) { create(:credit_card, user_id: normal_user.id, gateway_customer_profile_id: "random") }

        it "can not view user" 


        it "can view own credit cards" 

      end
    end

    describe '#update' do
      let(:credit_card) { create(:credit_card, name: 'Joe Shmoe', user: credit_card_user) }
      let(:credit_card_user) { create(:user) }

      before do
        stub_authentication!
      end

      context 'when the user is authorized' do
        let(:current_api_user) { credit_card_user }

        it 'updates the credit card' 

      end

      context 'when the user is not authorized' do
        let(:current_api_user) { create(:user) }

        it 'rejects the request' 

      end
    end
  end
end

