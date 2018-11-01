require 'rails_helper'

describe 'CleverIntegration::Importers::Classrooms' do

  let!(:teacher) {
    create(:teacher, :signed_up_with_clever)
  }

  let!(:district_token) { '1' }

  let!(:sections_response) {
    [
      {id: teacher.clever_id,
       name: 'section1',
       grade: '2'}
    ]
  }

  let!(:teacher_requester) {
    response_stuct = Struct.new(:sections)
    response = response_stuct.new(sections_response)

    lambda do |clever_id, district_token|
      response
    end
  }


  def subject
    CleverIntegration::Importers::Classrooms.run(teacher, district_token, teacher_requester)
    Classroom.find_by(clever_id: teacher.clever_id, name: 'section1', grade: '2')
  end

  it 'creates a classroom' 


  it 'associates classroom to teacher' 

end

