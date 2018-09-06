require 'rails_helper'

describe "Edit a circle", js: true do
  
  let(:circle)        { create(:circle, :with_admin) }
  let(:admin)         { circle.admin }

  let(:circle_form)   { PageObject::Circle::Form.new }

  context "with valid inputs" do

    let(:inputs) { attributes_for(:circle_create_form) }

    before { circle_form.load(circle_id: circle.id, as: admin.id) }

    it "works" 

  end

  context "when form is submitted empty" do

    let(:inputs) { attributes_for(:empty_required_circle_attributes) }

    before { circle_form.load(circle_id: circle.id, as: admin.id) }

    it "shows all error messages" 

  end

end

