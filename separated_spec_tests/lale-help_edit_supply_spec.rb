require 'rails_helper'

describe "Edit a supply", js: true do
  
  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let!(:supply) { create(:supply, working_group: working_group) }

  let(:supply_form) { PageObject::Supply::Form.new }
  
  context "with valid inputs" do
    let(:inputs) { attributes_for(:supply).merge(location: 'Atlanta') }

    before { supply_form.load(circle_id: circle.id, supply_id: supply.id, action: :edit, as: admin.id) }

    it "works" 

  end

end

