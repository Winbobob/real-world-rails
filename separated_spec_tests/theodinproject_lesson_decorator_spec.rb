require 'rails_helper'

RSpec.describe LessonDecorator do
  subject(:lesson_decorator) { LessonDecorator.new(lesson) }

  let(:lesson) {
    double(
      'Lesson',
      is_project?: is_project?,
      title: 'Ruby Basics',
      url: lesson_url,
      course: course
    )
  }

  let(:is_project?) { true }
  let(:lesson_url) { '/web_development_101/jquery_basics.md' }
  let(:course) { double('Course') }

  describe '#title' do
    it 'returns the project title' 


    context 'when lesson is not a project' do
      let(:is_project?) { false }

      it 'returns the normal lesson title' 

    end
  end

  describe '#next_lesson' do
    let(:find_lesson) { double('FindLesson', next_lesson: next_lesson) }
    let(:next_lesson) { double('Lesson') }

    before do
      allow(FindLesson).to receive(:new).with(lesson, course).
        and_return(find_lesson)
    end

    it 'returns the next lesson' 

  end

  describe '#course' do
    let(:decorated_course) { double('CourseDecorator') }

    before do
      allow(CourseDecorator).to receive(:new).with(course).
        and_return(decorated_course)
    end

    it 'returns a decorated course' 

  end
end

