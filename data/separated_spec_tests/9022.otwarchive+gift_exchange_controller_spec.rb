# frozen_string_literal: true

require 'spec_helper'

describe Challenge::GiftExchangeController do
  include LoginMacros
  include RedirectExpectationHelper

  before(:each) do
    @collection = FactoryGirl.create(:collection, challenge: GiftExchange.new)
    @collection.save
    fake_login_known_user(@collection.owners.first.user)
  end

  describe "new" do
    context "when a gift exchange challenge already exists for the collection" do
      before do
        post :new, params: { collection_id: @collection.name }
      end

      it "sets a flash message" 


      it "redirects to the collection's gift exchange edit page" 

    end
  end

  describe "create" do
    context "when freeform_num_required is negative (fails to save)" do
      it "renders the new template" 

    end
  end

  describe "update" do
    context "when freeform_num_required is negative (fails to save)" do
      it "renders the edit template" 

    end
  end

  describe "destroy" do
    before(:each) do
      delete :destroy, params: { id: @collection.challenge.id, collection_id: @collection.name }
    end

    it "removes challenge variables on Collection" 


    it "redirects to the collection's main page with a notice" 

  end
end

