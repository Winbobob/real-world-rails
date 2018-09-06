require 'rails_helper'

describe "Create a task", js: true do
  
  let(:circle)         { create(:circle, :with_admin_and_working_group) }
  let(:admin)          { circle.admin }
  let!(:working_group) { circle.working_groups.first }

  let(:task_form) { PageObject::Task::Form.new }
  let(:task_page) { PageObject::Task::Page.new }

  context "when only required fields are filled" do
  
    let(:inputs) { attributes_for(:task).merge(location: 'Munich') }
    before { task_form.load(circle_id: circle.id, action: :new, as: admin.id) }

    it "creates the task" 
    it "creates the task" 

  end

  context "when form is submitted empty" do
  
    let(:inputs) { {} }
    before { task_form.load(circle_id: circle.id, action: :new, as: admin.id) }
    
    it "shows all error messages" 

  end

end

