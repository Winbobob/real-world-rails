require 'rails_helper'

describe Teachers::ClassroomActivitiesController, type: :controller do
  let(:classroom) { create(:classroom)}
  let(:teacher) { classroom.owner }
  let(:classroom_activity) { create(:classroom_activity, classroom_id: classroom.id)}
  let(:classroom_activity2) { create(:classroom_activity, classroom_id: classroom.id, unit_id: classroom_activity.unit.id)}
  let(:classroom_activity3) { create(:classroom_activity, classroom_id: classroom.id, unit_id: classroom_activity.unit.id)}

  before do
    session[:user_id] = teacher.id
  end

  describe '#update' do
    it 'should be able to update due dates' 

  end

  describe '#update_multiple_due_dates' do
    it 'should be able to update due dates for an array of classroom activity ids' 

  end

end

