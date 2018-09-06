require 'rails_helper'

describe "Update project", js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let(:project) { create(:project, working_group: working_group) }

  context "when on edit project page" do
    
    before { visit edit_circle_project_path(id: project, circle_id: circle, as: admin) }

    let(:project_form) { PageObject::Project::Form.new }

    context "when only required fields are filled" do
      let(:inputs) { {name: "New project name"} }
      it "updates the project" 

    end

    context "when name is empty" do
      let(:inputs) { {name: ""} }
      it "shows an error message" 

    end
  end


end

