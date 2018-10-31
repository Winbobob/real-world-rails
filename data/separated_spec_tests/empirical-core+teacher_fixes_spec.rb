require 'rails_helper'

include TeacherFixes

describe TeacherFixes do


      let! (:classroom) {create(:classroom)}
      let! (:classroom2) {create(:classroom)}
      let! (:student1) {create(:student, classrooms: [classroom])}
      let! (:student2) {create(:student, classrooms: [classroom])}
      let! (:student3) {create(:student)}
      let! (:activity) {create(:activity)}
      let! (:classroom_unit1) {create(:classroom_unit, classroom: classroom)}
      let! (:classroom_unit2) {create(:classroom_unit, classroom: classroom)}
      let! (:classroom_unit3) {create(:classroom_unit, classroom: classroom)}
      let! (:classroom_unit4) {create(:classroom_unit, classroom: classroom)}
      let! (:final_score) {create(:activity_session, user_id: student1.id, classroom_unit_id: classroom_unit1.id, is_final_score: true)}
      let! (:not_final_score) {create(:activity_session, user_id: student1.id, classroom_unit_id: classroom_unit1.id)}
      let! (:lower_percentage) {create(:activity_session, user_id: student1.id, classroom_unit_id: classroom_unit2.id, percentage: 0.3)}
      let! (:higher_percentage) {create(:activity_session, user_id: student1.id, classroom_unit_id: classroom_unit2.id, percentage: 0.8)}
      let! (:started) {create(:activity_session, user_id: student1.id, classroom_unit_id: classroom_unit3.id, started_at: Time.now)}
      let! (:completed_earlier) {create(:activity_session, user_id: student1.id, classroom_unit_id: classroom_unit4.id, completed_at: Time.now - 5, state: 'finished', percentage: 0.7, activity: activity)}
      let! (:completed_later) {create(:activity_session, user_id: student1.id, classroom_unit_id: classroom_unit4.id, completed_at: Time.now, state: 'finished', percentage: 0.7, activity: activity)}
      let! (:classroom_unit_with_activity_sessions_1) {create(:classroom_unit_with_activity_sessions)}
      let! (:classroom_unit_with_activity_sessions_2) {create(:classroom_unit_with_activity_sessions)}

      describe '#merge_activity_sessions_between_two_classroom_units' do
        it 'moves all activity sessions from the first classroom unit to the second' 


        # it 'hides the first passed classroom unit' do
        #   TeacherFixes::merge_activity_sessions_between_two_classroom_units(classroom_unit_with_activity_sessions_1.reload, classroom_unit_with_activity_sessions_2.reload)
        #   expect(classroom_unit_with_activity_sessions_1.reload.visible).not_to be
        # end
      end

      describe "#hide_extra_activity_sessions" do
        context "there is an activity session with a final score" do
          it "leaves the activity session with a final score" 


          it "hides all other activity sessions with that user id and classroom unit id" 


        end

        context "there are activities with percentages assigned" do
          it "leaves the activity session with the highest percentage" 


          it "hides all other activity sessions with that user id and classroom unit id" 


        end

        context "there are activities that have been started" do
          it "leaves the activity session that was started most recently" 


          it "hides all other activity sessions with that user id and classroom unit id" 


        end

      end

      describe("#same_classroom?") do
        it 'returns true if the students are in the same classroom' 

        it 'returns false if the students are not in the same classroom' 

      end

      describe("#move_activity_sessions") do
        it 'finds or creates a classroom unit for the new classroom with that student assigned' 

      end

      describe '#merge_two_schools' do
        let!(:school) { create(:school) }
        let!(:other_school) { create(:school) }
        let!(:teacher) { create(:teacher) }

        it 'should move teachers to new school' 

      end

      describe '#merge_two_classrooms' do

        it 'should move students to new classroom' 


        it 'should move classroom units to new classroom' 


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

  describe '#merge_two_units and #merge_two_classroom_units' do
    let (:student_a) {create(:student)}
    let (:student_b) {create(:student)}
    let! (:classroom_with_classroom_units) {create(:classroom_with_classroom_units, students: [student_a, student_b])}
    let! (:unit_1) {create(:unit, user_id: classroom_with_classroom_units.owner.id)}
    let! (:unit_2) {create(:unit, user_id: classroom_with_classroom_units.owner.id)}
    let (:activity_session_1) {create(:activity_session, classroom_unit: classroom_with_classroom_units.classroom_units.first, user_id: student_a.id)}
    let (:activity_session_2) {create(:activity_session, classroom_unit: classroom_with_classroom_units.classroom_units.last, user_id: student_b.id)}

    def cu_1
      classroom_with_classroom_units.classroom_units.first
    end

    def cu_2
      classroom_with_classroom_units.classroom_units.last
    end

    def prep
      cu_1.update(assigned_student_ids: [student_a.id], unit_id: unit_1.id)
      cu_2.update(assigned_student_ids: [student_b.id], unit_id: unit_2.id)
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

        it 'has no classroom units' 

      end

      describe '#self.merge_two_classroom_units' do
        it 'is called when both units have a classroom unit with the same classroom' 


        it 'is not called when both units do not have a classroom unit with the same classroom' 

      end
    end



    describe '#merge_two_classroom_units' do

      it 'moves all assigned students from the first activity to the second' 


      it 'calls #self.merge_activity_sessions_between_two_classroom_units' 

    end
  end
end

