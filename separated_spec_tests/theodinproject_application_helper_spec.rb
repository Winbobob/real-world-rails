require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#chat_link' do
    it 'returns the chat url' 

  end

  describe 'title' do
    it 'sets the title' 


    context 'when there is no input' do
      it 'returns nil' 

    end
  end

  describe '#bootstrap_class_for' do
    let(:flash_type) { 'alert' }

    it 'returns the bootstrap alert class' 


    context 'when flash type is notice' do
      let(:flash_type) { 'notice' }

      it 'returns the bootstrap success class' 

    end

    context 'when custom flash type' do
      let(:flash_type) { 'error' }

      it 'returns the bootstrap success class' 

    end
  end

  describe '#active_class' do
    let(:path) { '/courses' }

    context 'when the current page matches the path' do
      before do
        allow(helper).to receive(:current_page?).with(path).and_return(true)
      end

      it 'returns active' 

    end

    context 'when the current page does not match the path' do
      before do
        allow(helper).to receive(:current_page?).with(path).and_return(false)
      end

      it 'returns nil' 

    end
  end

  describe '#first_four_success_stories' do
    it 'returns the first four success stories' 

  end

  context 'course progress' do
    let(:user) { double('User') }
    let(:course) { double('Course') }
    let(:course_progress) { double('CourseProgress') }

    before do
      allow(user).to receive(:progress_for).with(course).and_return(course_progress)
    end

    context 'when user has not started the course' do
      before do
        allow(course_progress).to receive_messages(
          started?: false,
          completed?: false,
          percentage: 0
        )
      end

      describe '#course_started_by_user?' do
        it 'returns false' 

      end

      describe '#course_completed_by_user?' do
        it 'returns false' 

      end

      describe '#percentage_completed_by_user' do
        it 'returns 0' 

      end

      describe '#modifier_for_badge' do
        it 'returns the course show progress modifier for the course badge' 

      end
    end

    context 'when user has started the course' do
      before do
        allow(course_progress).to receive_messages(
          started?: true,
          completed?: false,
          percentage: 30
        )
      end

      describe '#course_started_by_user?' do
        it 'returns true' 

      end

      describe '#course_completed_by_user?' do
        it 'returns false' 

      end

      describe '#percentage_completed_by_user' do
        it 'returns 30' 

      end

      describe '#modifier_for_badge' do
        it 'returns the course show progress modifier for the course badge' 

      end
    end

    context 'when user has completed the course' do
      before do
        allow(course_progress).to receive_messages(
          started?: true,
          completed?: true,
          percentage: 100
        )
      end

      describe '#course_started_by_user?' do
        it 'returns true' 

      end

      describe '#course_completed_by_user?' do
        it 'returns true' 

      end

      describe '#percentage_completed_by_user' do
        it 'returns 100' 

      end

      describe '#modifier_for_badge' do
        it 'returns the course completed modifier for the course badge' 

      end
    end
  end

  describe '#next_lesson_to_complete' do

    let(:course) { double('Course') }
    let(:lesson_completions) { }
    let(:lesson_completion) { double('LessonCompletion') }
    let(:next_lesson) {
      double('NextLesson', to_complete: lesson_to_complete )
    }
    let(:lesson_to_complete) { double('Lesson') }

    before do
      allow(NextLesson).to receive(:new).
        with(course, lesson_completions).and_return(next_lesson)
    end

    it 'returns the next lesson the user has to complete' 

  end
end

