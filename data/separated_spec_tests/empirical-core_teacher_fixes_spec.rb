require 'rails_helper'

include TeacherFixes

describe TeacherFixes do


      let! (:classroom) {create(:classroom)}
      let! (:classroom2) {create(:classroom)}
      let! (:student1) {create(:student, classrooms: [classroom])}
      let! (:student2) {create(:student, classrooms: [classroom])}
      let! (:student3) {create(:student)}
      let! (:activity) {create(:activity)}
      let! (:classroom_activity1) {create(:classroom_activity, classroom: classroom)}
      let! (:classroom_activity2) {create(:classroom_activity, classroom: classroom)}
      let! (:classroom_activity3) {create(:classroom_activity, classroom: classroom)}
      let! (:classroom_activity4) {create(:classroom_activity, classroom: classroom, activity: activity)}
      let! (:final_score) {create(:activity_session, user_id: student1.id, classroom_activity_id: classroom_activity1.id, is_final_score: true)}
      let! (:not_final_score) {create(:activity_session, user_id: student1.id, classroom_activity_id: classroom_activity1.id)}
      let! (:lower_percentage) {create(:activity_session, user_id: student1.id, classroom_activity_id: classroom_activity2.id, percentage: 0.3)}
      let! (:higher_percentage) {create(:activity_session, user_id: student1.id, classroom_activity_id: classroom_activity2.id, percentage: 0.8)}
      let! (:started) {create(:activity_session, user_id: student1.id, classroom_activity_id: classroom_activity3.id, started_at: Time.now)}
      let! (:completed_earlier) {create(:activity_session, user_id: student1.id, classroom_activity_id: classroom_activity4.id, completed_at: Time.now - 5, state: 'finished', percentage: 0.7)}
      let! (:completed_later) {create(:activity_session, user_id: student1.id, classroom_activity_id: classroom_activity4.id, completed_at: Time.now, state: 'finished', percentage: 0.7)}
      let! (:classroom_activity_with_activity_sessions_1) {create(:classroom_activity_with_activity_sessions)}
      let! (:classroom_activity_with_activity_sessions_2) {create(:classroom_activity_with_activity_sessions)}

      describe '#merge_activity_sessions_between_two_classroom_activities' do
        it 'moves all activity sessions from the first classroom activity to the second' 


        # it 'hides the first passed classroom activity' do
        #   TeacherFixes::merge_activity_sessions_between_two_classroom_activities(classroom_activity_with_activity_sessions_1.reload, classroom_activity_with_activity_sessions_2.reload)
        #   expect(classroom_activity_with_activity_sessions_1.reload.visible).not_to be
        # end
      end

      describe "#hide_extra_activity_sessions" do
        context "there is an activity session with a final score" do
          it "leaves the activity session with a final score" 


          it "hides all other activity sessions with that user id and classroom activity id" 


        end

        context "there are activities with percentages assigned" do
          it "leaves the activity session with the highest percentage" 


          it "hides all other activity sessions with that user id and classroom activity id" 


        end

        context "there are activities that have been started" do
          it "leaves the activity session that was started most recently" 


          it "hides all other activity sessions with that user id and classroom activity id" 


        end

      end

      describe("#same_classroom?") do
        it 'returns true if the students are in the same classroom' 

        it 'returns false if the students are not in the same classroom' 

      end

      describe("#move_activity_sessions") do
        it 'finds or creates a classroom activity for the new classroom with that student assigned' 

      end

      describe '#merge_two_schools' do
        let!(:school) { create(:school) }
        let!(:other_school) { create(:school) }
        let!(:teacher) { create(:teacher) }

        it 'should move teachers to new school' 

      end

      describe '#merge_two_classrooms' do

        it 'should move students to new classroom' 


        it 'should move classroom activities to new classroom' 


        it 'should move teachers to new classroom' 


        it 'should archive the old classroom' 


      end

      describe '#delete_last_activity_session' do

        it "should delete a student's last completed activity session for a given activity" 


        it "should update another activity session to be final score if possible" 


      end

      describe "#get_all_completed_activity_sessions_for_a_given_user_and_activity" do
        it "should return all of a student's completed activity sessions for a given activity id" 

      end

  describe '#merge_two_units and #merge_two_classroom_activities' do
    let (:student_a) {create(:student)}
    let (:student_b) {create(:student)}
    let! (:classroom_with_classroom_activities) {create(:classroom_with_classroom_activities, students: [student_a, student_b])}
    let! (:unit_1) {create(:unit, user_id: classroom_with_classroom_activities.owner.id)}
    let! (:unit_2) {create(:unit, user_id: classroom_with_classroom_activities.owner.id)}
    let (:activity_session_1) {create(:activity_session, classroom_activity: classroom_with_classroom_activities.classroom_activities.first, user_id: student_a.id)}
    let (:activity_session_2) {create(:activity_session, classroom_activity: classroom_with_classroom_activities.classroom_activities.last, user_id: student_b.id)}

    def ca_1
      classroom_with_classroom_activities.classroom_activities.first
    end

    def ca_2
      classroom_with_classroom_activities.classroom_activities.last
    end

    def prep
      ca_1.update(assigned_student_ids: [student_a.id], unit_id: unit_1.id)
      ca_2.update(assigned_student_ids: [student_b.id], unit_id: unit_2.id, activity_id: ca_1.activity_id + 1)
      activity_session_1
      activity_session_2
    end

    describe '#merge_two_units' do

      before(:each) do
        prep
      end

      describe 'the first unit passed' do
        # it 'is no longer visible' do
        #   TeacherFixes::merge_two_units(unit_1, unit_2)
        #   expect(unit_1.reload.visible).not_to be
        # end

        it 'has no classroom activities' 

      end

      describe '#self.merge_two_classroom_activities' do
        it 'is called when both units have a classroom activity with the same activity and classroom' 


        it 'is not called when both units do not have a classroom activity with the same activity and classroom' 

      end

      it "changes first unit's Classroom Activities' unit_ids to unit_two if they have a different activity_id than classroom_activities in unit two" 


    end



    describe '#merge_two_classroom_activities' do

      it 'moves all assigned students from the first activity to the second' 


      it 'calls #self.merge_activity_sessions_between_two_classroom_activities' 

    end
  end
end

