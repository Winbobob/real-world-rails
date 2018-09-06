# frozen_string_literal: true

require 'spec_helper'

describe Spree::Api::StoreCreditEventsController, type: :request do
  let(:api_user) { create(:user, :with_api_key) }

  describe "GET mine" do
    subject do
      get spree.mine_api_store_credit_events_path(format: :json), headers: { 'X-Spree-Token' => api_key }
    end

    context "no current api user" do
      let(:api_key) { nil }

      before { subject }

      it "returns a 401" 

    end

    context "the current api user is authenticated" do
      let(:current_api_user) { create(:user, :with_api_key) }
      let(:api_key) { current_api_user.spree_api_key }

      context "the user doesn't have store credit" do
        before { subject }

        it "should set the events variable to empty list" 


        it "returns a 200" 

      end

      context "the user has store credit" do
        let!(:store_credit) { create(:store_credit, user: current_api_user) }

        before { subject }

        it "should contain the store credit allocation event" 


        it "returns a 200" 

      end
    end
  end
end

