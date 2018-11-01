# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::SubmissionQuestion::CommentsController do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let!(:submission_question) { create(:submission_question) }
    let!(:user) { submission_question.submission.creator }
    let(:assessment) { submission_question.submission.assessment }
    let(:course) { assessment.course }
    before { sign_in(user) }

    describe '#create' do
      subject do
        post :create, as: :js, params: {
          course_id: course, assessment_id: assessment,
          submission_question_id: submission_question,
          discussion_post: {
            text: comment
          }
        }
      end

      before do
        controller.instance_variable_set(:@submission_question, submission_question)
      end

      context 'when comment creation fails' do
        let(:comment) { nil }

        it 'returns HTTP 400' 

      end

      context 'when comment creation succeeds' do
        let(:comment) { 'new comment' }

        it 'returns HTTP 200' 


        it 'adds a new comment' 


        context 'when other users are subscribed to notifications' do
          let!(:subscriber) do
            user = create(:course_manager, course: course).user
            submission_question.acting_as.subscriptions.create!(user: user)
            user
          end

          it 'sends email notifications' 


          context 'when "New Comment" email notification is disabled' do
            before do
              context =
                OpenStruct.new(key: Course::AssessmentsComponent.key, current_course: course)
              setting = {
                'key' => 'new_comment', 'enabled' => false,
                'options' => { 'category_id' => assessment.tab.category.id }
              }
              Course::Settings::AssessmentsComponent.new(context).update_email_setting(setting)
              course.save!
            end

            it 'does not send email notifications' 

          end
        end
      end
    end
  end
end

