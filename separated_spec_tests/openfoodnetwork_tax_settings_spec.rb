require 'spec_helper'

feature 'Account and Billing Settings' do
  include AuthenticationWorkflow
  include WebHelper

  describe "updating" do
    let!(:admin) { create(:admin_user) }

    before do
      Spree::Config.set({
        products_require_tax_category: false,
        shipment_inc_vat: false,
        shipping_tax_rate: 0
      })
    end

    before do
      quick_login_as_admin
    end

    context "as an admin user" do
      it "loads the page" 


      it "attributes can be changed" 

    end
  end
end

