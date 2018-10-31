# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::PromotionsController, type: :controller do
  stub_authorization!

  let!(:promotion1) { create(:promotion, name: "name1", code: "code1", path: "path1") }
  let!(:promotion2) { create(:promotion, name: "name2", code: "code2", path: "path2") }
  let!(:category) { create :promotion_category }

  describe "#show" do
    it "redirects to edit" 

  end

  describe "#index" do
    it "succeeds" 


    it "assigns promotion categories" 


    context "search" do
      it "pages results" 


      it "filters by name" 


      it "filters by code" 


      it "filters by path" 

    end
  end

  describe "#create" do
    subject { post :create, params: params }
    let(:params) { { promotion: { name: 'some promo' } } }

    context "it succeeds" do
      context "with no single code param" do
        it "creates a promotion" 


        it "sets the flash message" 


        it "redirects to promotion edit" 


        it "doesn't create any promotion codes" 

      end

      context "with a single code" do
        let(:params) { { promotion: { name: 'some promo' }, single_code: "promo" } }

        it "creates a promotion" 


        it "sets the flash message" 


        it "redirects to promotion edit" 


        it "creates a promotion code" 

      end
    end

    context "it fails" do
      let(:params) { {} }

      it "does not create a promotion" 


      it "sets the flash error" 


      it "renders new" 

    end
  end
end

