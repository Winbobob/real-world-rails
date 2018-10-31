require 'rails_helper'

describe 'CleverIntegration::Sync::SubMain' do

  include_context 'clever'

  let!(:district) {
    create(:district, clever_id: 'district_id_1', token: 'token1')
  }

  let!(:district_response) {
    response = Struct.new(:teachers)
    teachers = [
      {
        id: 'teacher_id_1',
        name: {
          first: 'teacherjohn',
          last: 'teachersmith'
        },
        email: 'teacher@gmail.com',
        district: 'district_id_1'
      }

    ]
    response.new(teachers)
  }

  let!(:requesters2) {
    requesters.merge(
      {district_requester: helper(district_response)}
    )
  }

  def subject
    CleverIntegration::Sync::SubMain.run(requesters2)
  end



  it 'creates teachers' 


  it 'associates teachers to district' 


  it 'associates school to teacher if school exists' 


  it 'does not associate school to teacher if school does not exists' 


  it 'creates classrooms' 


  it 'associates classrooms to teacher' 


  it 'creates students' 


  it 'associates student to classroom' 

end

