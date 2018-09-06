require 'rails_helper'

describe "Create a supply", js: true do
  
  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let(:supply_form) { PageObject::Supply::Form.new }

  before { supply_form.load(circle_id: circle.id, action: :new, as: admin.id) }

  context "when only required attributes are filled" do
    let(:inputs) { attributes_for(:supply).merge(location: 'Munich') }
    it "creates the supply" 

  end

  context "when no mandatory field is filled" do
    let(:inputs) { {} }
    it "shows all error messages" 

  end
end

