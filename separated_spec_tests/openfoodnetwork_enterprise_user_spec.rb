require "spec_helper"

feature %q{
    As a Super User
    I want to setup users to manage an enterprise
} do
  include AuthenticationWorkflow
  include WebHelper
  include AdminHelper

  let!(:user) { create_enterprise_user }
  let!(:supplier1) { create(:supplier_enterprise, name: 'Supplier 1') }
  let!(:supplier2) { create(:supplier_enterprise, name: 'Supplier 2') }
  let(:supplier_profile) { create(:supplier_enterprise, name: 'Supplier profile', sells: 'none') }
  let!(:distributor1) { create(:distributor_enterprise, name: 'Distributor 3') }
  let!(:distributor2) { create(:distributor_enterprise, name: 'Distributor 4') }
  let(:distributor_profile) { create(:distributor_enterprise, name: 'Distributor profile', sells: 'none') }

  describe "creating an enterprise user" do
    context "with a limitted number of owned enterprises" do
      scenario "setting the enterprise ownership limit" do
        expect(user.enterprise_limit).to eq 5
        login_to_admin_section
        click_link 'Users'
        click_link user.email

        fill_in "user_enterprise_limit", with: 2

        click_button 'Update'
        user.reload
        expect(user.enterprise_limit).to eq 2
      end
    end
  end

  describe "product management" do
    describe "managing supplied products" do
      before do
        user.enterprise_roles.create!(enterprise: supplier1)
        product1 = create(:product, name: 'Green eggs', supplier: supplier1)
        product2 = create(:product, name: 'Ham', supplier: supplier2)
        login_to_admin_as user
      end

      it "can manage products that I supply" 

    end
  end

  # This case no longer exists as anyone with an enterprise can supply into the system. 
  # Or can they?? There is no producer profile anyway.
  # TODO discuss what parts of this are still necessary in which cases.
  pending "with only a profile-level enterprise" do
    before do
      user.enterprise_roles.create! enterprise: supplier_profile
      user.enterprise_roles.create! enterprise: distributor_profile
      login_to_admin_as user
    end

    it "shows me only menu items for enterprise management" 


    describe "dashboard" do
      it "shows me enterprise management controls" 


      it "shows me product management controls, but not order_cycle controls" 


      it "shows me enterprise product info but not payment methods, shipping methods or enterprise fees" 

    end

    it "shows me only profile options on the enterprise listing page" 


    it "shows me only profile fields on the hub edit page" 

  end

  describe "system management lockdown" do
    before do
      user.enterprise_roles.create!(enterprise: supplier1)
      login_to_admin_as user
    end

    scenario "should not be able to see system configuration" do
      visit spree.edit_admin_general_settings_path
      page.should have_content 'Unauthorized'
    end

    scenario "should not be able to see user management" do
      visit spree.admin_users_path
      page.should have_content 'Unauthorized'
    end
  end
end

