require 'rails_helper'

describe "Add Document to a Working Group", js: true do

  let(:circle)        { create(:circle, :with_admin) }
  let(:admin)         { circle.admin }
  let(:working_group) { create(:working_group, :with_members, circle: circle, admin: admin) }

  let(:dashboard_page) { PageObject::WorkingGroup::Dashboard.new }
  let(:local_file_path) { File.expand_path('spec/fixtures/images/avatar.jpg') }
  let(:file_name)       { "Test File" }


  before { dashboard_page.load(circle_id: circle.id, wg_id: working_group.id, as: admin.id) }
  before { dashboard_page.tab_nav.documents.click }

  it "by clicking a button" 

end

