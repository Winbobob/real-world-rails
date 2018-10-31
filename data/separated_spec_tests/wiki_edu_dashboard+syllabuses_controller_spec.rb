# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Courses::SyllabusesController, type: :controller do
  describe '#update' do
    let(:course) { create(:course) }
    let(:instructor) do
      create(:user, id: 5)
      create(:courses_user, user_id: 5,
                            course_id: course.id,
                            role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
      User.find(5)
    end

    before do
      allow(controller).to receive(:current_user).and_return(instructor)
    end

    it 'saves a pdf' 


    it 'deletes a saved file' 


    it 'renders an error for disallowed file types' 

  end
end

