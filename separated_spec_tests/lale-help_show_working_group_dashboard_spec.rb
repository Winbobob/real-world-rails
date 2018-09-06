require 'rails_helper'

describe "Show working group dashboard", js: true do

  let(:circle)        { create(:circle, :with_admin) }
  let(:admin)         { circle.admin }
  let(:working_group) { create(:working_group, :with_members, circle: circle, admin: admin) }
  let(:volunteers)    { working_group.members }

  let(:dashboard_page) { PageObject::WorkingGroup::Dashboard.new }

  let!(:task)   { create(:task, working_group: working_group, organizer: volunteers.first) }
  let!(:supply) { create(:supply, working_group: working_group, organizer: volunteers.first) }
  let!(:project) { create(:project, working_group: working_group) }
  let!(:file) { create(:working_group_file_upload, uploadable: working_group) }

  before { dashboard_page.load(circle_id: circle.id, wg_id: working_group.id, as: admin.id) }

  it "shows the working group's resources" 


  it "shows organizers and volunteers" 


end

