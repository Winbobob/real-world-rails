require 'rails_helper'

describe Api::V1::ProgressReportsController, type: :controller do
  let(:classroom) { create(:classroom_with_students_and_activities) }
  let(:teacher) { classroom.owner }
  let(:unaffiliated_teacher) { create(:teacher) }
  let(:student) { classroom.students.first }
  let(:unaffiliated_student) { create(:student) }

  context '#activities_scores_by_classroom_data' do
    it 'should return ProgressReports::ActivitiesScoresByClassroom for my classes' 

  end

  context '#student_overview_data' do
    it 'should not allow access if no teacher classroom relationship exists' 


    it 'should not allow access if student is not in classroom' 


    it 'should return appropriate data' 

  end
end

