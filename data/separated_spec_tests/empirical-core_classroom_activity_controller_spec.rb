require 'rails_helper'

describe Api::V1::ClassroomActivitiesController, type: :controller do
  let(:other_teacher) { create(:teacher) }
  let(:classroom) {create(:classroom_with_lesson_classroom_activities)}
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

    it 'does not authenticate a teacher who does not own the classroom activity' 


    it 'authenticates a teacher who does own the classroom activity' 


    it 'returns JSON object with follow up url if requested' 


    it 'returns JSON object with link to home if not requested' 

  end

end

