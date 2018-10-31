require 'rails_helper'

describe TeacherFixController do
  it { should use_before_filter :staff! }

  let(:staff) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { staff }
  end

  describe '#get_archived_units' do
    context 'when user does not exist' do
      it 'should render no such user' 

    end

    context 'when user is not teacher' do
      let!(:user) { create(:student) }

      it 'should render user is not a teacher' 

    end

    context 'when user is teacher' do
      let!(:user) { create(:teacher) }

      context 'when archived units are present' do
        let!(:unit) { create(:unit, visible: false, user_id: user.id) }

        it 'should render the archived units' 

      end

      context 'when archived units are not present' do
        it 'should render the user has no archived units' 

      end
    end
  end

  describe '#unarchive_units' do
    let!(:unit) { create(:unit, visible: false) }
    let!(:activity) { create(:classroom_unit, unit_id: unit.id, visible: false) }
    let!(:session) { create(:activity_session, classroom_unit_id: activity.id, visible: false) }
    let!(:unit1) { create(:unit, visible: false) }
    let!(:activity1) { create(:classroom_unit, unit_id: unit1.id, visible: false) }
    let!(:session1) { create(:activity_session, classroom_unit_id: activity.id) }
    let!(:unit2) { create(:unit, visible: false) }
    let!(:activity2) { create(:classroom_unit, unit_id: unit2.id, visible: false) }
    let!(:session2) { create(:activity_session, classroom_unit_id: activity.id) }

    it 'should change the names of given units' 


    it 'should make all the units visible' 


    it 'should mark all the activity sessions visible' 

  end

  describe '#recover_classroom_units' do
    context 'classroom exists' do
      let!(:classroom) { create(:classroom) }
      let!(:unit) { create(:unit, visible: false) }
      let!(:classroom_unit) { create(:classroom_unit, visible: false,classroom_id: classroom.id, unit_id: unit.id) }

      it 'should mark the units and activit sessions visible' 

    end

    context 'classroom does not exist' do
      it 'should render no such classroom' 

    end
  end

  describe '#recover_unit_activities' do
    context 'when user exists and role is teacher' do
      let!(:user) { create(:teacher) }

      let!(:unit) { create(:unit, user_id: user.id, name: "some name") }
      let!(:classroom_unit) { create(:classroom_unit, unit_id: unit.id, visible: true) }
      let!(:unit_activity) { create(:unit_activity, unit_id: unit.id, visible: false) }

      it 'should update all the unit activities' 

    end
  end

  describe '#recover_activity_sessions' do
    context 'when user exists and role is teacher' do
      let!(:user) { create(:teacher) }

      context 'when unit exists' do
        let!(:another_user) { create(:user) }
        let!(:unit) { create(:unit, user_id: user.id, name: "some name") }
        let!(:classroom_unit) { create(:classroom_unit, unit_id: unit.id, visible: false) }
        let!(:activity_session) { create(:activity_session, visible: false, classroom_unit_id: classroom_unit.id, user_id: another_user.id) }

        it 'should update all the classroom activities' 

      end

      context 'when unit does not exist' do
        it 'should render the user does not have a unit' 

      end
    end

    context 'when user exists but not teacher' do
      let!(:user) { create(:user) }

      it 'should render cannot find teacher' 

    end

    context 'when user does not exist' do
      it 'should render cannot find teacher' 

    end
  end

  describe '#merge_student_accounts' do
    context 'when both the accounts exist' do
      context 'when both the accounts are students' do
        context 'when both students are from the same classroom' do
          let!(:student) { create(:student) }

          before do
            allow(TeacherFixes).to receive(:same_classroom?) { true }
          end

          context 'when second account has only one classroom' do
            let!(:student1) { create(:student, classrooms: [create(:classroom)]) }

            it 'should merge activity sessions' 

          end

          context 'when second account does not have one classroom' do
            let!(:student1) { create(:student, classrooms: [create(:classroom), create(:classroom)]) }

            it 'should render that user is in more than 1 classroom' 

          end
        end

        context 'when both students are not from the same classroom' do
          let!(:student) { create(:student) }
          let!(:student1) { create(:student) }

          before do
            allow(TeacherFixes).to receive(:same_classroom?) { false }
          end

          it 'should return that students are not in the same classroom' 

        end
      end

      context 'when both the accounts are not students' do
        let!(:student) { create(:student) }
        let!(:user) { create(:user) }

        it 'should render that student is not a student' 

      end
    end

    context 'when both the accounts do not exist' do
      let!(:student) { create(:student) }

      it 'should render that we do not have an account for the user' 

    end
  end

  describe '#merge_teacher_accounts' do
    context 'when both the account exist' do
      context 'when both the accounts are teachers' do
        let!(:teacher) { create(:teacher) }
        let!(:teacher1) { create(:teacher) }
        let!(:unit) { create(:unit, user_id: teacher.id) }
        let!(:classrooms_teacher) { create(:classrooms_teacher, user_id: teacher.id) }

        it 'should update the classrooms teacher and unit' 

      end

      context 'when both the accounts are not teachers' do
        let!(:teacher) { create(:teacher) }
        let!(:user) { create(:user) }

        it 'should render that user is not a teacher' 

      end
    end

    context 'when both the accounts dont exist' do
      let!(:teacher) { create(:teacher) }

      it 'should render that user does not exist' 

    end
  end

  describe '#move_student_from_one_class_to_another' do
    context 'when user exists' do
      context 'when user is a student' do
        let!(:user) { create(:student) }

        context 'when both classrooms exists' do
          let!(:classroom) { create(:classroom) }
          let!(:classroom1) { create(:classroom) }

          context 'when students classrooms exist' do
            let!(:students_classroom) { create(:students_classrooms, student_id: user.id, classroom_id: classroom.id) }
            let!(:students_classroom1) { create(:students_classrooms, student_id: user.id, classroom_id: classroom1.id, visible: false) }

            it 'should update the students classrooms, move the activity session and destroy the students classrooms' 

          end

          context 'when students classrooms does not exist' do
            it 'should render student is not in any classrooms' 

          end
        end

        context 'when both classrooms dont exist' do
          let!(:classroom) { create(:classroom) }

          it 'should render that classroom could not be found' 

        end
      end

      context 'when user is not a student' do
        let!(:user) { create(:user) }

        it 'should render user is not a student' 

      end
    end

    context 'when user does not exist' do
      it 'should render account does not exist' 

    end
  end

  describe '#google_unsync_account' do
    context 'when user exists' do
      context 'when new email is not given' do
        let!(:user) { create(:student, :signed_up_with_google) }

        it 'should reset the google id and set the signed up with google flag' 

      end

      context 'when new email is given' do
        let!(:user) { create(:student, :signed_up_with_google) }

        it 'should update the email, reset the google id and set the signed up with google flag' 

      end
    end

    context 'when user does not exist' do
      it 'should render user does not exist' 

    end
  end

  describe '#merge_two_schools' do
    context 'when to school id given' do
      it 'should not merge the schools' 

    end

    context 'when from school id given' do
      it 'should not merge the schools' 

    end

    context 'when both school ids given' do
      it 'should merge the two schools' 

    end
  end

  describe '#merge_two_classrooms' do
    context 'when first classrooms exists' do
      let!(:classroom) { create(:classroom) }

      it 'should not merge the classrooms' 

    end

    context 'when second classroom exists' do
      let!(:classroom) { create(:classroom) }

      it 'should not merge the classrooms' 

    end

    context 'when both classrooms exist' do
      let!(:classroom) { create(:classroom) }
      let!(:classroom1) { create(:classroom) }

      it 'should merge the two classrooms' 

    end
  end

  describe '#delete_last_activity_session' do
    context 'when user does not exist' do
      let!(:activity) { create(:activity) }

      it 'should render no such student' 

    end

    context 'when activity does not exist' do
      let!(:user) { create(:user) }

      it 'should render no such activity' 

    end

    context 'when user and activity exist' do
      let!(:user) { create(:user) }
      let!(:activity) { create(:activity) }

      it 'should delete the last activity session' 

    end
  end
end

