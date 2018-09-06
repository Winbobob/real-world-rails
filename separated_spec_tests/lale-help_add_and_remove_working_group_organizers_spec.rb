require 'rails_helper'

describe "Add and remove working group organizers", js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let(:roles_page) { PageObject::WorkingGroup::Roles.new(circle, working_group, admin) }

  describe "add" do

    context "circle has a member that's not in the working group yet" do

      let!(:circle_member) { create(:circle_role_volunteer, circle: circle).user }

      before { roles_page.load_for(:organizers) }
      before { expect(roles_page).to have_no_users }

      it "can be added" 

    end
  end

  describe "remove" do

    context "working group has two organizers" do

      let!(:organizers) do
        create_list(:working_group_organizer_role, 2, working_group: working_group).map do |role|
          role.user
        end
      end

      before { roles_page.load_for(:organizers) }

      it "one organizer can be removed" 

    end

  end

end

