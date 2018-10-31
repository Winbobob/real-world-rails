require 'rails_helper'

describe 'CleverIntegration::Importers::School' do

  let!(:teacher) {
    create(:teacher, :signed_up_with_clever)
  }

  let!(:district_token) { '1' }

  let!(:school_response) {
    {nces_id: 'school1'}
  }

  let!(:teacher_requester) {
    response_struct = Struct.new(:school)
    response = response_struct.new(school_response)

    lambda do |clever_id, district_token|
      response
    end
  }


  def subject
    CleverIntegration::Importers::School.run(teacher, district_token, teacher_requester)
  end

  it 'associates school to teacher if the school exists' 


  it 'does not associates school to teacher if the school does not exist' 

end

