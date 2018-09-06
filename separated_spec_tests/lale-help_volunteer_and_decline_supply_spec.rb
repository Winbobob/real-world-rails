require 'rails_helper'

describe "Volunteer for and decline a supply", js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let!(:supply) { create(:supply, working_group: working_group) }

  let(:supply_page) { PageObject::Supply::Page.new }

  describe "volunteering for a supply" do
    context "when on the supply page" do
      before { supply_page.load_for(supply, as: admin) }

      it "works" 

    end
  end

  describe "declining from a supply" do
    context "when on the supply page" do

      before { supply_page.load_for(supply, as: admin) }

      context "when already volunteered" do

        before { supply_page.volunteer_button.click }

        it "works" 

      end

    end
  end

end

