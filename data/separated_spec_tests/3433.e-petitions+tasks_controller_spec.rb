require 'rails_helper'

RSpec.describe Admin::TasksController, type: :controller, admin: true do
  context "when not logged in" do
    [
      ["POST", "/admin/tasks", :create, {}]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the login page" 

      end

    end
  end

  context "when logged in as a moderator" do
    let(:moderator) { FactoryBot.create(:moderator_user) }
    before { login_as(moderator) }

    [
      ["POST", "/admin/tasks", :create, {}]
    ].each do |method, path, action, params|

      describe "#{method} #{path}" do
        before { process action, method, params }

        it "redirects to the admin hub page" 

      end

    end
  end

  context "when logged in as a sysadmin" do
    let(:sysadmin) { FactoryBot.create(:sysadmin_user) }
    before { login_as(sysadmin) }

    describe "POST /admin/tasks" do
      context "with no selected tasks" do
        before do
          expect(Admin::TaskRunner).not_to receive(:run)
          post :create, tasks: []
        end

        it "redirects back to the tasks tab" 


        it "sets the flash :notice key" 

      end

      context "with invalid params" do
        before do
          expect(Admin::TaskRunner).to receive(:run).and_return(false)
          post :create, tasks: %w[task_1], task_1: {}
        end

        it "redirects back to the tasks tab" 


        it "sets the flash :notice key" 

      end

      context "with one task" do
        before do
          expect(Admin::TaskRunner).to receive(:run).and_return(true)
          post :create, tasks: %w[task_1], task_1: {}
        end

        it "redirects back to the tasks tab" 


        it "sets the flash :notice key" 

      end

      context "with two tasks" do
        before do
          expect(Admin::TaskRunner).to receive(:run).and_return(true)
          post :create, tasks: %w[task_1 task_2], task_1: {}, task_2: {}
        end

        it "redirects back to the tasks tab" 


        it "sets the flash :notice key" 

      end
    end
  end
end

