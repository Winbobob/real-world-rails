require 'rails_helper'

describe 'CleverIntegration::SignUp::SubMain' do

  include_context 'clever'

  def subject
    CleverIntegration::SignUp::SubMain.run(auth_hash, requesters)
  end

  context 'district sign up' do
    let!(:auth_hash) {
      {
        info: {
          user_type: 'district',
          id: 'district_id_1',
          name: 'district1'
        },
        credentials: {
          token: 'token1'
        }
      }
    }

    it 'creates the right district' 

  end

  context 'student signs up' do
    let!(:auth_hash) {
      {
        info: {
          user_type: 'student',
          id: 'student_id_1'
        }
      }
    }

    context 'student pre-exists in our system' do
      let!(:preexisting_student) {
        create(:user, clever_id: 'student_id_1')
      }

      it 'finds the pre-existing student (created when the teacher signed up (which must occur beforehand))' 

    end

    context 'student does not pre-exist in our system' do
      it 'returns failure message' 

    end
  end

  context 'teacher signs up' do
    let!(:auth_hash) {
      {
        info: {
          user_type: 'teacher',
          id: 'teacher_id_1',
          name: {
            first: 'teacherjohn',
            last: 'teachersmith'
          },
          email: 'teacher@gmail.com',
          district: 'district_id_1'
        }
      }
    }

    context 'district does not pre-exist in our system' do
      it 'returns failure message' 

    end

    context 'district pre-exists in our system' do

      let!(:district) {
        create(:district, clever_id: 'district_id_1')
      }

      it 'creates the teacher' 


      it 'associates the teacher to the district' 


      describe 'the teacher' do
        it "does not have a school if there is not a school with a matching nces_id" 


        it "does have a school if there is a school with a matching nces_id " 

      end

      it 'associates the school to the teacher' 


      it "creates teacher's classrooms" 


      it 'associates classrooms to teacher' 

    end
  end
end

