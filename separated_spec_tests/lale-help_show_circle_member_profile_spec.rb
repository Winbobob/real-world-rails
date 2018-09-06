require 'rails_helper'

describe "Show a circle member profile", js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group, :with_volunteer) }
  let(:working_group) { circle.working_groups.first }
  let!(:member)       { circle.admin }
  let(:admin)         { create(:circle_admin_role, circle: circle).user }

  let!(:task_completed_by_member) { create(:task, :completed, working_group: working_group, volunteer: member) }

  let(:member_page) { PageObject::Member::Page.new }

  before { member_page.load(circle_id: circle.id, member_id: member.id, as: admin.id) }

  it "shows the member page" 


end

