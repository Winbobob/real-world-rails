# frozen_string_literal: true

require "spec_helper"

module Spree
  describe Api::StoresController, type: :request do
    let!(:store) do
      create(:store, name: "My Spree Store", url: "spreestore.example.com")
    end

    before do
      stub_authentication!
    end

    context "as an admin" do
      sign_in_as_admin!

      let!(:non_default_store) do
        create(:store,
          name: "Extra Store",
          url: "spreestore-5.example.com",
          default: false)
      end

      it "can list the available stores" 


      it "can get the store details" 


      it "can create a new store" 


      it "can update an existing store" 


      context "deleting a store" do
        it "will fail if it's the default Store" 


        it "will destroy the store" 

      end
    end

    context "as an user" do
      it "cannot list all the stores" 


      it "cannot get the store details" 


      it "cannot create a new store" 


      it "cannot update an existing store" 

    end
  end
end

