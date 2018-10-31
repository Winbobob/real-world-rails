# frozen_string_literal: true

require 'rails_helper'

describe TrainingStatusController do
  render_views
  describe '#show' do
    let(:user) { create(:user) }
    let(:course) { create(:course) }
    let(:week) { create(:week, course_id: course.id) }
    let!(:block) { create(:block, week_id: week.id, training_module_ids: [1]) }
    let!(:courses_user) do
      create(:courses_user, course_id: course.id, user_id: user.id,
                            role: CoursesUsers::Roles::STUDENT_ROLE)
    end

    context 'when the training is incomplete' do
      it 'includes the not completed status for a user' 

    end

    context 'when the training is complete' do
      let(:completion_date) { Time.now }

      before do
        create(:training_modules_users, training_module_id: 1,
                                        completed_at: completion_date, user_id: user.id)
      end

      it 'includes the completion date' 

    end
  end
end

