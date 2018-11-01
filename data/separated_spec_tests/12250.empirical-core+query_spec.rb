require 'rails_helper'

describe 'ScorebookQuery' do

  let!(:teacher) { create(:teacher_with_a_couple_classrooms_with_one_student_each) }
  let!(:classroom) { teacher.classrooms_i_teach.first }
  let!(:classroom1) { teacher.classrooms_i_teach.second }
  let!(:student) { classroom.students.first }
  let!(:student1) { classroom1.students.first }

  let!(:teacher1) {create(:teacher) }

  let!(:section) {create(:section)}
  let!(:topic_category) {create(:topic_category)}
  let!(:topic) {create(:topic, topic_category: topic_category, section: section)}
  let!(:activity_classification) {create :activity_classification}

  let!(:activity1) {create(:activity, topic: topic, classification: activity_classification)}
  let!(:activity2) {create(:activity, topic: topic, classification: activity_classification)}

  let!(:unit) {create(:unit)}

  let!(:classroom_unit) {create(:classroom_unit, classroom: classroom, unit: unit, assigned_student_ids: [student.id]  )}

  let!(:unit_activity1) {create(:unit_activity, activity: activity1, unit: unit  )}
  let!(:unit_activity2) {create(:unit_activity, activity: activity2, unit: unit )}

  let!(:activity_session1) {create(:activity_session,  completed_at: Time.now, percentage: 1.0, user: student, classroom_unit: classroom_unit, activity: activity1, is_final_score: true)}
  let!(:activity_session2) {create(:activity_session,  completed_at: Time.now, percentage: 0.2, user: student, classroom_unit: classroom_unit, activity: activity2, is_final_score: true)}

  it 'returns a completed activity that is a final scores' 


  describe 'support date constraints' do
    it 'returns activities completed between the specified dates' 


    it 'does not return activities completed after the specified end date' 


    it 'does not return activities completed before the specified start date' 


    context 'time zones' do
      def activity_session_completed_at_to_time_midnight_minus_offset(activity_session, offset)
        original_completed_at = activity_session.completed_at.to_date.to_s
        new_completed_at = Scorebook::Query.to_offset_datetime(original_completed_at, offset)
        activity_session.update(completed_at: new_completed_at)
        new_completed_at
      end

      it "factors in offset to return activities where the teacher is in a different timezone than the database" 

    end
  end

end

