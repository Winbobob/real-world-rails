require 'rails_helper'

describe ProfilesController, type: :controller do
  describe 'as a student' do
    let(:classroom) {create(:classroom)}
    let(:student) { create(:student) }
    let(:other_student) {create(:student)}
    let(:activity) { create(:activity) }
    let(:unit) { create(:unit) }
    let(:classroom_activity) { create(:classroom_activity, activity: activity, unit: unit) }
    let!(:activity_session) { create(:activity_session,
                                      classroom_activity: classroom_activity,
                                      activity: activity,
                                      state: 'unstarted',
                                      user: student) }

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
        let(:student) { create(:student_in_two_classrooms_with_many_activities) }

        it 'returns correct student, classrooms, and teachers info based on current_classroom_id' 


        it 'returns student scores in the correct order' 


        it 'returns next activity session' 

      end
    end
  end
end

