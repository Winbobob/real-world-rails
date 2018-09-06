require 'rails_helper'

describe ClassroomsTeachersController, type: :controller do
  let(:teacher) { create(:teacher_with_a_couple_classrooms_with_one_student_each) }
  let(:classroom_one) { teacher.classrooms_i_own.first }
  let(:classroom_two) { teacher.classrooms_i_own.second }
  let(:coteacher) { create(:teacher) }

  describe '#update_coteachers' do
    it 'should create a new pending invitation if there is none' 


    it 'should not create a new pending invitation if there is one' 


    it 'should find or create new coteacher classroom invitations' 

  end
end


# notes for return: we need to create an archived flag on the pending invitations table 😱

