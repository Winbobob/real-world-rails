require 'spec_helper'

feature 'Enterprises Index' do
  include AuthenticationWorkflow
  include WebHelper

  context "as an admin user" do
    scenario "listing enterprises" do
      s = create(:supplier_enterprise)
      d = create(:distributor_enterprise)

      login_to_admin_section
      click_link 'Enterprises'

      within("tr.enterprise-#{s.id}") do
        expect(page).to have_content s.name
        expect(page).to have_select "enterprise_set_collection_attributes_1_sells"
        expect(page).to have_content "Edit Profile"
        expect(page).to have_content "Delete"
        expect(page).to_not have_content "Payment Methods"
        expect(page).to_not have_content "Shipping Methods"
        expect(page).to have_content "Enterprise Fees"
      end

      within("tr.enterprise-#{d.id}") do
        expect(page).to have_content d.name
        expect(page).to have_select "enterprise_set_collection_attributes_0_sells"
        expect(page).to have_content "Edit Profile"
        expect(page).to have_content "Delete"
        expect(page).to have_content "Payment Methods"
        expect(page).to have_content "Shipping Methods"
        expect(page).to have_content "Enterprise Fees"
      end
    end

    context "editing enterprises in bulk" do
      let!(:s){ create(:supplier_enterprise) }
      let!(:d){ create(:distributor_enterprise, sells: 'none') }
      let!(:d_manager) { create_enterprise_user(enterprise_limit: 1) }

      before do
        d_manager.enterprise_roles.build(enterprise: d).save
        expect(d.owner).to_not eq d_manager
      end

      context "without violating rules" do
        before do
          login_to_admin_section
          click_link 'Enterprises'
        end

        it "updates the enterprises" 

      end

      context "with data that violates rules" do
        let!(:second_distributor) { create(:distributor_enterprise, sells: 'none') }

        before do
          d_manager.enterprise_roles.build(enterprise: second_distributor).save
          expect(d.owner).to_not eq d_manager

          login_to_admin_section
          click_link 'Enterprises'
        end

        it "does not update the enterprises and displays errors" 

      end
    end
  end

  describe "as the manager of an enterprise" do
    let(:supplier1) { create(:supplier_enterprise, name: 'First Supplier') }
    let(:supplier2) { create(:supplier_enterprise, name: 'Another Supplier') }
    let(:distributor1) { create(:distributor_enterprise, name: 'First Distributor') }
    let(:distributor2) { create(:distributor_enterprise, name: 'Another Distributor') }
    let(:distributor3) { create(:distributor_enterprise, name: 'Yet Another Distributor') }
    let(:enterprise_manager) { create_enterprise_user }
    let!(:er) { create(:enterprise_relationship, parent: distributor3, child: distributor1, permissions_list: [:edit_profile]) }

    before(:each) do
      enterprise_manager.enterprise_roles.build(enterprise: supplier1).save
      enterprise_manager.enterprise_roles.build(enterprise: distributor1).save

      login_to_admin_as enterprise_manager
    end

    context "listing enterprises", js: true do
      it "displays enterprises I have permission to manage" 



      it "does not give me an option to change or update the package and producer properties of enterprises I manage" 

    end
  end

  describe "as the owner of an enterprise" do
    let!(:user) { create_enterprise_user }
    let!(:owned_distributor) { create(:distributor_enterprise, name: 'Owned Distributor', owner: user) }

    before do
      login_to_admin_as user
    end

    context "listing enterprises", js: true do
      it "allows me to change or update the package and producer properties of enterprises I manage" 

    end
  end
end

