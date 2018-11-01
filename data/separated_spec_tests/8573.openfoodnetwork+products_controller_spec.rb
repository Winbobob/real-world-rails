require 'spec_helper'

module Spree
  describe Spree::Api::ProductsController, type: :controller do
    render_views

    let(:supplier) { create(:supplier_enterprise) }
    let(:supplier2) { create(:supplier_enterprise) }
    let!(:product1) { create(:product, supplier: supplier) }
    let(:product_other_supplier) { create(:product, supplier: supplier2) }
    let(:attributes) { [:id, :name, :supplier, :price, :on_hand, :available_on, :permalink_live] }

    let(:current_api_user) { build_stubbed(:user) }

    before do
      allow(controller).to receive(:spree_current_user) { current_api_user }
    end

    context "as a normal user" do
      before do
        allow(current_api_user)
          .to receive(:has_spree_role?).with("admin").and_return(false)
      end

      it "should deny me access to managed products" 

    end

    context "as an enterprise user" do
      let(:current_api_user) do
        user = create(:user)
        user.enterprise_roles.create(enterprise: supplier)
        user
      end

      it "retrieves a list of managed products" 


      it "soft deletes my products" 


      it "is denied access to soft deleting another enterprises' product" 

    end

    context "as an administrator" do
      before do
        allow(current_api_user)
          .to receive(:has_spree_role?).with("admin").and_return(true)
      end

      it "retrieves a list of managed products" 


      it "retrieves a list of products with appropriate attributes" 


      it "sorts products in ascending id order" 


      it "formats available_on to 'yyyy-mm-dd hh:mm'" 


      it "returns permalink as permalink_live" 


      it "should allow available_on to be nil" 


      it "soft deletes a product" 

    end

    describe '#clone' do
      context 'as a normal user' do
        before do
          allow(current_api_user)
            .to receive(:has_spree_role?).with("admin").and_return(false)
        end

        it 'denies access' 

      end

      context 'as an enterprise user' do
        let(:current_api_user) do
          user = create(:user)
          user.enterprise_roles.create(enterprise: supplier)
          user
        end

        it 'responds with a successful response' 


        it 'clones the product' 

      end

      context 'as an administrator' do
        before do
          allow(current_api_user)
            .to receive(:has_spree_role?).with("admin").and_return(true)
        end


        it 'responds with a successful response' 


        it 'clones the product' 

      end
    end
  end
end

