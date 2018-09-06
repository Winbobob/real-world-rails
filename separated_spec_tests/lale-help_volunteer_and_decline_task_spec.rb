require 'rails_helper'

describe "Volunteer for and decline a task", js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let!(:task) { create(:task, working_group: working_group) }

  let(:task_page) { PageObject::Task::Page.new }

  describe "volunteering for a task" do
    context "when on the task page" do
      before { task_page.load_for(task, as: admin) }

      it "works" 

    end
  end

  describe "declining from a task" do
    context "when on the task page" do

      before { task_page.load_for(task, as: admin) }

      context "when already volunteered" do

        before { task_page.volunteer_button.click }

        it "works" 

      end

    end
  end

end

