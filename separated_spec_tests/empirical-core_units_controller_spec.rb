require 'rails_helper'

describe Teachers::UnitsController, type: :controller do
  let!(:student) {create(:student)}
  let!(:classroom) { create(:classroom, students: [student]) }
  let!(:teacher) { classroom.owner }
  let!(:unit) {create(:unit, user: teacher)}
  let!(:unit2) {create(:unit, user: teacher)}
  let!(:classroom_activity) { create(
    :classroom_activity_with_activity,
    unit: unit, classroom: classroom,
    assigned_student_ids: [student.id]
  )}

  before do
      session[:user_id] = teacher.id # sign in, is there a better way to do this in test?
  end

  describe '#create' do
    it 'kicks off a background job' 

  end

  describe '#index' do
    let!(:activity) {create(:activity)}
    let!(:classroom_activity) {create(:classroom_activity, due_date: Time.now, unit: unit, classroom: classroom, activity: activity, assigned_student_ids: [student.id])}
    let!(:activity_session) {create(:activity_session,
      activity: activity,
      classroom_activity: classroom_activity,
      user: student,
      state: 'finished'
    )}

    it 'should return json in the appropriate format' 


    # TODO write a VCR-like test to check when this request returns something other than what we expect.
  end

  describe '#update' do

    it 'sends a 200 status code when a unique name is sent over' 


    it 'sends a 422 error code when a non-unique name is sent over' 

  end

  describe '#classrooms_with_students_and_classroom_activities' do

    it "returns #get_classrooms_with_students_and_classroom_activities when it is passed a valid unit id" 



    it "sends a 422 error code when it is not passed a valid unit id" 


  end

  describe '#update_classroom_activities_assigned_students' do

    it "sends a 200 status code when it is passed valid data" 


    it "sends a 422 status code when it is passed invalid data" 


  end

  describe '#update_activities' do

    it "sends a 200 status code when it is passed valid data" 


    it "sends a 422 status code when it is passed invalid data" 

  end

  describe '#select_lesson_with_activity_id' do
    let!(:activity) { create(:lesson_activity) }

    before(:each) do
      ClassroomActivity.destroy_all
      session['user_id'] = classroom_activity.classroom.owner.id
    end

    it 'should redirect to a lessons index if there are no lessons' 


    it 'should redirect to the lesson if there is only one lesson' 


    it 'should redirect to a lessons index if there are multiple lessons' 

  end

end

