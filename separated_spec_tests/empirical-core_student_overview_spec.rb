require 'rails_helper'

describe 'StudentOverview' do
  let!(:classroom) {create(:classroom_with_classroom_activities)}
  let!(:student) {User.find(ActivitySession.first.user_id)}

  before do
    ClassroomActivity.update_all(assigned_student_ids: classroom.students.ids)
  end

  it "returns at least as many rows as the student was assigned activities within that classroom" 


  it "returns the score for each activity the student has completed" 


end

