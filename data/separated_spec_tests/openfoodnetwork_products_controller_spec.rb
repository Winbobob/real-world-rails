require 'spec_helper'

describe Spree::Admin::ProductsController, type: :controller do
  describe "updating a product we do not have access to" do
    let(:s_managed) { create(:enterprise) }
    let(:s_unmanaged) { create(:enterprise) }
    let(:p) { create(:simple_product, supplier: s_unmanaged, name: 'Peas') }

    before do
      login_as_enterprise_user [s_managed]
      spree_post :bulk_update, {"products" => [{"id" => p.id, "name" => "Pine nuts"}]}
    end

    it "denies access" 


    it "does not update any product" 

  end

  context "creating a new product" do
    before { login_as_admin }

    it "redirects to bulk_edit when the user hits 'create'" 


    it "redirects to new when the user hits 'add_another'" 

  end

  describe "updating" do
    describe "product properties" do
      context "as an enterprise user" do
        let(:producer) { create(:enterprise) }
        let!(:product) { create(:simple_product, supplier: producer) }
        let!(:property) { create(:property, name: "A nice name") }

        before do
          @request.env['HTTP_REFERER'] = 'http://test.com/'
          login_as_enterprise_user [producer]
        end

        context "when a submitted property does not already exist" do
          it "does not create a new property, or product property" 

        end

        context "when a submitted property exists" do
          it "adds a product property" 

        end
      end
    end
  end
end

