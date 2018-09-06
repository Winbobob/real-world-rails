require 'rails_helper'

describe "Add and remove working group volunteers", js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let(:roles_page) { PageObject::WorkingGroup::Roles.new(circle, working_group, admin) }

  describe "add" do

    context "circle has a member that's not in the working group yet" do

      let!(:circle_member) { create(:circle_role_volunteer, circle: circle).user }

      before { roles_page.load_for(:members) }
      before { expect(roles_page.volunteers).to eq([admin.name]) }

      it "can be added" 

    end
  end

  describe "remove" do

    context "working group has two volunteers" do

      # note: admin is already a volunteer in the working group
      let!(:volunteer) { create(:working_group_volunteer_role, working_group: working_group).user }

      before { roles_page.load_for(:members) }

      it "volunteer can be removed" 

    end
  end

end

