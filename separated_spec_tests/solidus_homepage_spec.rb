# frozen_string_literal: true

require 'spec_helper'

describe "Homepage", type: :feature do
  context 'as admin user' do
    stub_authorization!

    context "visiting the homepage" do
      before(:each) do
        visit spree.admin_path
      end

      it "should have a link to overview" 


      it "should have a link to orders" 


      it "should have a link to products" 


      it "should have a link to reports" 


      it "should have a link to configuration" 


      it "should have a link to promotions" 

    end

    context "visiting the products tab" do
      before(:each) do
        visit spree.admin_products_path
      end

      it "should have a link to products" 


      it "should have a link to option types" 


      it "should have a link to property types" 

    end

    context "visiting the promotions tab" do
      before(:each) do
        visit spree.admin_promotions_path
      end

      it "should have a link to promotions" 


      it "should have a link to promotion categories" 

    end
  end

  context 'as fakedispatch user' do
    before do
      allow_any_instance_of(Spree::Admin::BaseController).to receive(:spree_current_user).and_return(nil)
    end

    custom_authorization! do |_user|
      can [:admin, :home], :dashboards
      can [:admin, :edit, :index, :read], Spree::Order
    end

    it 'should only display tabs fakedispatch has access to' 

  end
end

