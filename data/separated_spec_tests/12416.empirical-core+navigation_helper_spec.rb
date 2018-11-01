require 'rails_helper'

describe NavigationHelper do
  describe '#home_page_should_be_active?' do
    context 'when action name is dashboard, my account, teacher guide or google sync' do
      before do
        allow(helper).to receive(:action_name) { "dashboard" }
      end

      it 'should return true' 

    end

    context 'when on subscriptions index' do
      before do
        allow(helper).to receive(:action_name) { "index" }
        allow(helper).to receive(:controller_name) { "subscriptions" }
      end

      it 'should return true' 

    end
  end

  describe '#classes_page_should_be_active?' do
    context 'when teachers classroom controller' do
      before do
        allow(helper).to receive(:controller) { double(:controller, class: Teachers::ClassroomsController) }
      end

      it 'should return true' 

    end

    context 'when invite_students action and not in concepts controller' do
      let(:class_double) { double(:class, parent: "something") }

      before do
        allow(helper).to receive(:controller) { double(:controller, class: class_double) }
        allow(helper).to receive(:action_name) { "invite_students" }
        allow(helper).to receive(:controller_name) { "anything" }
      end

      it 'should return true' 

    end
  end

  describe "#assign_activity_page_should_be_active?" do
    before do
      allow(helper).to receive(:controller) { double(:controller, class: Teachers::ClassroomManagerController) }
      allow(helper).to receive(:action_name) { "assign_activities" }
    end

    it 'should return true when classroom manager controller and assign activities action' 

  end

  describe '#my_activities_page_should_be_active?' do
    before do
      allow(helper).to receive(:controller) { double(:controller, class: Teachers::ClassroomManagerController) }
      allow(helper).to receive(:action_name) { "lesson_planner" }
    end

    it 'should return true if classroom manager controller and lesson planner action' 

  end

  describe '#student_reports_page_should_be_active' do

  end

  describe '#admin_page_should_be_active?' do
    before do
      allow(helper).to receive(:action_name) { "admin_dashboard" }
    end

    it 'should return true on admin dashboard action' 

  end

  describe '#Premium_tab_copy' do
    it 'should return the correct values' 

  end

  describe '#should_render_subnav?' do
    it 'should give the true on the right cases' 

  end
end

