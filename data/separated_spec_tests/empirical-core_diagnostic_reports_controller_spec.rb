require 'rails_helper'
describe Teachers::ProgressReports::DiagnosticReportsController, type: :controller do
include_context "Unit Assignments Variables"

  before do
    session[:user_id] = teacher.id
  end

  describe 'getting the report for a completed activity session' do
    describe 'updating existing recommendations' do
      let(:unit) {create(:unit)}
      let!(:classroom_activity) { create(:classroom_activity, activity: activity, unit: unit, classroom: classroom) }
      let!(:activity_session) { create(:activity_session, classroom_activity: classroom_activity, activity: activity, user: student) }
      it "redirects to the correct page" 

    end
  end

  describe 'assign_selected_packs recommendations' do

      it 'can create new units and classroom activities' 


      it 'creates units but does not create new classroom activities if passed no students ids' 


      it 'can update existing units without duplicating them' 


    end



    # describe 'for an existing unit' do
    #
    #   it "updates packs with new student ids if they should be updated" do
    #
    #   end
    #
    #   describe "does not duplicate the original" do
    #     it "unit" do
    #
    #     end
    #
    #     it "classroom activities" do
    #
    #     end
    #
    #     it "activity sessions" do
    #
    #     end
    #
    #   end
    #
    #   describe "if necessary, it assigns new" do
    #     it "activity packs" do
    #
    #     end
    #     it "classroom activities" do
    #
    #     end
    #
    #     it "activity sessions" do
    #
    #     end
    #   end
    #
    #
    # end





end

