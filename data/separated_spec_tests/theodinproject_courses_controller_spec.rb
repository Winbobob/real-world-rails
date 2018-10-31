require 'rails_helper'

RSpec.describe CoursesController do
  let(:course_id) { 'abc123' }
  let(:course) { double('Course', id: course_id) }
  let(:courses) { [course] }
  let(:decorated_course) { double('CourseDecorator') }

  before do
    allow(CourseDecorator).to receive(:new).with(course).
      and_return(decorated_course)
  end

  describe 'GET index' do
    before do
      allow(Course).to receive(:order).and_return(courses)
    end

    it 'assigns @courses' 


    it 'renders the :index template' 

  end

  describe 'GET show' do
    before do
      allow(Course).to receive_message_chain(:includes, :friendly, :find).
        and_return(course)
    end

    it 'assigns @course' 


    it 'renders the course' 

  end
end

