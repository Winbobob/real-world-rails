require 'rails_helper'

describe StudentsClassroomsController, type: :controller do
  describe '#create' do
    context 'when current user exists' do
      let(:user) { create(:user) }

      before do
        allow(controller).to receive(:current_user) { user }
      end

      context 'when classroom is found' do
        let!(:classroom) { create(:classroom) }

        it 'should kick off the students to classroom associator and join classroom worker' 

      end

      context 'when classroom is not found' do
        context 'when classroom is archived' do
          let!(:classroom) { create(:classroom, visible: false) }

          it 'should return that class is archived' 

        end

        context 'when classroom does not exist' do
          it 'should return the class does not exist' 

        end
      end
    end

    context 'when current user does not exist' do
      it 'should return not logged in' 

    end
  end

  # describe '#hide' do
  #   let(:student) { create(:student) }
  #   let!(:student_classroom) { StudentsClassrooms.create!(student: student, classroom: create(:classroom)) }
  #
  #   before do
  #     allow(controller).to receive(:current_user) { student }
  #   end
  #
  #   it 'should find the classroom and hide it' do
  #     student_classroom.update(visible: false)
  #     post :hide, id: student_classroom.id
  #     expect(student_classroom.reload.visible).to eq false
  #   end
  # end
end

