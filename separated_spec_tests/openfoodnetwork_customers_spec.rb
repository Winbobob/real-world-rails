require 'spec_helper'

feature 'Customers' do
  include AuthenticationWorkflow
  include WebHelper

  context "as an enterprise user" do
    let(:user) { create_enterprise_user(enterprise_limit: 10) }
    let(:managed_distributor1) { create(:distributor_enterprise, owner: user) }
    let(:managed_distributor2) { create(:distributor_enterprise, owner: user) }
    let(:unmanaged_distributor) { create(:distributor_enterprise) }

    describe "using the customers index", js: true do
      let!(:customer1) { create(:customer, enterprise: managed_distributor1, code: nil) }
      let!(:customer2) { create(:customer, enterprise: managed_distributor1, code: nil) }
      let!(:customer3) { create(:customer, enterprise: unmanaged_distributor) }
      let!(:customer4) { create(:customer, enterprise: managed_distributor2) }

      before do
        quick_login_as user
        visit admin_customers_path
      end

      it "passes the smoke test" 


      it "allows updating of attributes" 


      it "prevents duplicate codes from being saved" 


      describe 'updating a customer addresses' do
        before do
          select2_select managed_distributor2.name, from: "shop_id"
        end

        it 'updates the existing billing address' 


        it 'creates a new shipping address' 

      end

      describe "creating a new customer" do
        context "when no shop has been selected" do
          it "asks the user to select a shop" 

        end

        context "when a shop is selected" do
          before do
            select2_select managed_distributor1.name, from: "shop_id"
          end

          it "creates customers when the email provided is valid" 

        end
      end
    end
  end
end

