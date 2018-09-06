require 'rails_helper'

describe "Delete a task", js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let!(:task) { create(:task, working_group: working_group) }

  let(:task_page) { PageObject::Task::Page.new }

  before { task_page.load_for(task, as: admin) }

  describe "delete a task" do
    it "works" 

  end

end

