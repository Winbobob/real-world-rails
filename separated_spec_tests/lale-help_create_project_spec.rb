require 'rails_helper'

describe "Create project", js: true do
  
  let(:circle)    { create(:circle, :with_admin, :with_volunteer) }
  let(:admin)     { circle.admin }
  let(:volunteer) { circle.volunteers.first }

  let!(:working_group) { create(:public_working_group, circle: circle, admin: admin, member: volunteer) }
  let!(:working_group_2) { create(:public_working_group, circle: circle, admin: admin, member: volunteer) }
    
  let(:project_form) { PageObject::Project::Form.new }

  context "when only required fields are filled" do

    let(:inputs) { attributes_for(:project).merge(organizer_name: admin.name) }
    before { project_form.load(circle_id: circle.id, as: admin.id) }

    it "creates the project" 

  end

  context "when all fields are filled" do

    let(:inputs) { attributes_for(:project).merge(organizer_name: volunteer.name, working_group_name: working_group_2.name) }
    before { project_form.load(circle_id: circle.id, as: admin.id) }

    it "creates the project" 

  end
  
  context "when no mandatory field is filled" do
    let(:inputs) { {} }
    before { project_form.load(circle_id: circle.id, as: admin.id) }
    it "shows all error messages" 

  end

end

