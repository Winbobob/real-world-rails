require 'rails_helper'

describe "Show my activities", js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let(:activities_page) { PageObject::Circle::MyActivities.new }

  let!(:task_where_admin_is_organizer) { create(:task, working_group: working_group, organizer: admin) }
  let!(:task_where_admin_is_volunteer) { create(:task, working_group: working_group, volunteer: admin) }

  let!(:supply_where_admin_is_organizer) { create(:supply, working_group: working_group, organizer: admin) }
  let!(:supply_where_admin_is_volunteer) { create(:supply, working_group: working_group, volunteer: admin) }

  before { activities_page.load(circle_id: circle.id, as: admin.id) }

  describe "Volunteered tasks and supplies" do

    it "shows only volunteered resources" 

  end

  describe "Organized tasks and supplies" do

    it "shows only organized resources" 

  end

end

