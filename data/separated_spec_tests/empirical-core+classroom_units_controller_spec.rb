require 'rails_helper'

describe Api::V1::ClassroomUnitsController, type: :controller do
  let(:other_teacher) { create(:teacher) }
  let(:classroom) { create(:classroom) }
  let(:students) { create_list(:student, 5) }
  let(:classroom_unit) do
    create(:classroom_unit,
      classroom: classroom,
      assigned_student_ids: students.map(&:id)
    )
  end
  let(:activity) { create(:lesson_activity, :with_follow_up) }
  let!(:activity_sessions) do
    students.map do |student|
      create(:activity_session,
        classroom_unit: classroom_unit,
        activity: activity,
        user: student
      )
    end
  end
  let(:teacher) { classroom.owner }

  context '#student_names' do
    it 'does not authenticate a teacher who is not associated with the classroom activity' 


    it 'authenticates a teacher who is associated with the classroom activity classroom' 


    it 'returns JSON object with activity session name key values' 


    it 'returns JSON object with student id key values' 

  end

  context '#teacher_and_classroom_name' do
    it 'does not authenticate a teacher who is not associated with the classroom activity' 


    it 'authenticates a teacher who is associated with the classroom activity classroom' 


    it 'returns JSON object with activity session name key values' 

  end

  context '#finish_lesson' do
    let(:follow_up_activity) { create(:activity) }
    let(:activity) { create(:activity, follow_up_activity: follow_up_activity) }

    it 'does not authenticate a teacher who does not own the classroom activity' 


    it 'authenticates a teacher who does own the classroom activity' 


    it 'returns JSON object with follow up url if requested' 


    it 'returns JSON object with link to home if not requested' 

  end

  describe '#unpin_and_lock_activity' do
    let(:unit_activity) do
      UnitActivity.find_by(unit: classroom_unit.unit, activity: activity)
    end

    let!(:classroom_unit_activity_state) do
      create(:classroom_unit_activity_state,
        classroom_unit: classroom_unit,
        unit_activity: unit_activity,
        pinned: true,
        locked: false
      )
    end

    before do
      session[:user_id] = teacher.id
    end

    it 'should unpin and lock the state of classroom unit activity' 

  end

  describe '#classroom_teacher_and_coteacher_ids' do
    let(:teacher_ids) { Hash[classroom.teacher_ids.collect {|i| [i, true]}] }

    before do
      session[:user_id] = teacher.id
    end

    it 'should return the teacher ids in the classroom' 

  end

end

