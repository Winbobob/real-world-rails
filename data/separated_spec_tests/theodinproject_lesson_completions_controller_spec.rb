require 'rails_helper'

RSpec.describe LessonCompletionsController do
  let(:user) { double('User', id: '1') }
  let(:lesson) { double('Lesson', id: '1') }
  let(:lesson_completion_attrs) {
    { lesson_id: lesson.id, student_id: user.id }
  }

  context 'unauthenticated user' do
    describe 'POST #create' do
      it 'returns unauthorized status' 

    end

    describe 'DELETE #destroy' do
      it 'returns unauthorized status' 

    end
  end

  context 'authenticated user' do
    before do
      allow(User).to receive(:includes).with(:lesson_completions).
        and_return(user)

      allow(user).to receive(:find).with('1').and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
      allow(Lesson).to receive(:friendly).and_return(lesson)
      allow(lesson).to receive(:find).with(lesson.id).and_return(lesson)
    end

    describe 'POST #create' do
      it 'saves the lesson_completion record to the database' 


      it 'renders the :create template' 

    end

    describe 'DELETE #destroy' do
      let(:lesson_completions) { [lesson_completion] }
      let(:lesson_completion) { double('LessonCompletion') }

      before do
        allow(LessonCompletion).to receive(:where).
          with(student_id: '1', lesson_id: '1').and_return(lesson_completions)

        allow(lesson_completion).to receive(:destroy)
      end

      it 'destroys the lesson_completion object' 


      it 'renders the create template' 

    end
  end
end

