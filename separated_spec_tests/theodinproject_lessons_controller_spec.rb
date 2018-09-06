require 'rails_helper'

RSpec.describe LessonsController do
  let(:lesson) { double('Lesson', id: 'abc123', has_submission?: false) }
  let(:ad) { double('Ad') }
  let(:params) { { course_title: 'web-development-101', id: lesson_id } }
  let(:lesson_id) { 'abc123' }
  let(:course) { double('Course') }
  let(:user) { double('User', id: '1') }

  before do
    allow(controller).to receive(:current_user).and_return(user)

    allow(User).to receive(:includes).with(:completed_lessons).
      and_return(user)

    allow(user).to receive(:find).with('1').and_return(user)

    allow(Lesson).to receive(:includes).
      with(:section, course: [:lessons, sections: [:lessons]]).
        and_return(lesson)

    allow(lesson).to receive(:friendly).and_return(lesson)
    allow(lesson).to receive(:find).with(params[:id]).and_return(lesson)
  end

  describe 'GET show' do
    it 'renders the lesson' 


    it 'assigns @lesson' 


    context 'when lesson cannot be found' do
      let(:lesson_id) { '123' }
      let(:request) { get :show, params: params }

      before do
        allow(Lesson).to receive(:friendly).and_return(lesson)
        allow(lesson).to receive(:find).with('123')
          .and_raise(ActiveRecord::RecordNotFound)
        request
      end

      it 'returns a status of 404' 


      it 'renders the 404 page' 

    end
  end
end

