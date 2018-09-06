require 'rails_helper'

describe "Create working group", js: true do
  
  let(:circle)    { create(:circle, :with_admin, :with_volunteer) }
  let(:admin)     { circle.admin }

  let(:wg_form) { PageObject::WorkingGroup::Form.new }
  let(:wg_page) { PageObject::WorkingGroup::Dashboard.new }

  context "when only required fields are filled" do

    let(:inputs) { attributes_for(:working_group, organizer_name: admin.name) }
    before { wg_form.load(circle_id: circle.id, as: admin.id) }

    it "creates the working group" 

  end

  context "when no mandatory field is filled" do
    let(:inputs) { {} }
    before { wg_form.load(circle_id: circle.id, as: admin.id) }
    it "shows all error messages" 

  end

end

