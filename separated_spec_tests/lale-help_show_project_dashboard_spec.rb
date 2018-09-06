require 'rails_helper'

describe "Show project dashboard", js: true do

  let!(:circle)        { create(:circle, :with_admin) }
  let(:admin)          { circle.admin }
  let!(:working_group) { create(:working_group, admin: admin, circle: circle) }
  let!(:project)       { create(:project, working_group: working_group, admin: admin) }

  let(:dashboard_page) { PageObject::Project::Dashboard.new }

  let!(:task)   { create(:task, working_group: working_group, project: project) }
  let!(:supply) { create(:supply, working_group: working_group, project: project) }
  let!(:file) { create(:working_group_file_upload, uploadable: project) }

  before { dashboard_page.load(circle_id: circle.id, project_id: project.id, as: admin.id) }

  it "shows the project info and resources" 


end

