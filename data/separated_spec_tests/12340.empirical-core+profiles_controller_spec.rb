require 'rails_helper'

describe ProfilesController, type: :controller do
  describe 'as a student' do
    let!(:classroom) {create(:classroom)}
    let!(:student) { create(:student) }
    let!(:students_classrooms) do
      create(:students_classrooms,
        student: student,
        classroom: classroom
      )
    end
    let!(:other_student) {create(:student)}
    let!(:activity) { create(:activity) }
    let!(:unit) { create(:unit) }
    let!(:unit_activity) { create(:unit_activity, unit: unit, activity: activity) }
    let!(:classroom_unit) do
      create(:classroom_unit,
        unit: unit,
        classroom: classroom,
        assigned_student_ids: [student.id]
      )
    end

    before do
      session[:user_id] = student.id
    end

    it 'loads the student profile' 


    context '#students_classrooms_json' do
      it 'should return a list of classes the current user is in' 

    end

    context "#student_profile_data" do

      it "returns an error when the current user has no classrooms" 


      context 'when the student has a single classroom' do
        it "returns student, classroom, and teacher info when the current user has classrooms" 

      end

      context 'when the student is in multiple classrooms' do
        it 'returns correct student, classrooms, and teachers info based on current_classroom_id' 


        it 'returns student scores in the correct order' 


        it 'returns next activity session' 

      end
    end
  end
end

