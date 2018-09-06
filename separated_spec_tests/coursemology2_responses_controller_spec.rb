# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Survey::ResponsesController do
  let!(:instance) { Instance.default }

  with_tenant(:instance) do
    let(:admin) { create(:administrator) }
    let!(:course) { create(:course, creator: admin) }
    let(:manager) { create(:course_manager, course: course) }
    let!(:student) { create(:course_student, course: course) }
    let!(:survey) { create(:survey, *survey_traits, { course: course }.merge(survey_options)) }
    let!(:survey_question) do
      section = create(:course_survey_section, survey: survey)
      create(:course_survey_question, question_type: :text, section: section)
    end
    let(:new_question) do
      section = create(:course_survey_section, survey: survey)
      create(:course_survey_question, question_type: :text, section: section)
    end
    let(:survey_response) do
      create(:response, *response_traits,
             survey: survey, creator: student.user, course_user: student)
    end
    let(:survey_traits) { nil }
    let(:survey_options) { {} }
    let(:response_traits) { nil }
    let(:json_response) { JSON.parse(response.body) }

    before { sign_in(user) }

    describe '#index' do
      let(:user) { create(:administrator) }

      context 'when html page is requested' do
        subject { get :index, params: { course_id: course.id, survey_id: survey.id } }

        it { is_expected.to render_template('index') }
      end

      context 'when json data is requested' do
        render_views
        subject { get :index, params: { format: :json, course_id: course.id, survey_id: survey.id } }
        before do
          survey_response
          subject
        end

        it 'responds with the necessary fields' 

      end
    end

    describe '#create' do
      let(:create_response_request) do
        post :create, as: :json, params: { course_id: course.id, survey_id: survey.id }
      end

      context 'when user is a student' do
        let(:user) { student.user }
        let(:survey_traits) { [:published, :currently_active] }

        context 'when response has not already been created' do
          it 'creates a response with answers populated' 

        end

        context 'when response has already been created' do
          render_views

          before { survey_response }
          it 'responds with details of the existing survey response' 

        end
      end

      context 'when user is not enrolled in the course' do
        let(:user) { create(:administrator) }
        before { create_response_request }
        it { is_expected.to respond_with :bad_request }
      end
    end

    describe '#show' do
      subject do
        get :show, as: :json,
                   params: { course_id: course.id, survey_id: survey.id, id: survey_response.id }
      end

      context 'when a new question is created after response was last edited' do
        let(:user) { manager.user }

        before do
          survey_response
          new_question
          subject
        end

        it 'does not create answers for new questions' 

      end

      context 'when the survey is anonymous' do
        let(:survey_traits) { [:published, :currently_active, :anonymous] }

        context "when staff views a student's response" do
          let(:user) { manager.user }

          it 'denies access' 

        end

        context 'when user views his own response' do
          let(:user) { student.user }

          it { is_expected.to render_template('course/survey/responses/_response') }
        end
      end
    end

    describe '#edit' do
      subject do
        get :edit, as: :json,
                   params: { course_id: course.id, survey_id: survey.id, id: survey_response.id }
      end

      context 'when a new question is created after response was last edited' do
        let(:user) { student.user }
        let(:survey_traits) { [:published, :currently_active] }

        before do
          survey_response
          new_question
          subject
        end

        it 'creates answers for all new question' 

      end

      context 'when user is not response creator' do
        let(:user) { manager.user }

        it 'denies access' 

      end
    end

    describe '#update' do
      let(:user) { student.user }

      subject do
        patch :update, as: :json, params: {
          response: response_params,
          course_id: course.id, survey_id: survey.id, id: survey_response.id
        }
      end

      context 'when student submits an answer for a multiple response question' do
        let(:survey_traits) { [:published, :currently_active] }
        let(:survey_options) { { section_traits: [:with_mrq_question, :with_mcq_question] } }
        let(:multiple_response_question) { survey.questions.multiple_response.first }
        let(:multiple_choice_question) { survey.questions.multiple_choice.first }
        let(:question_option_ids) { multiple_response_question.options.map(&:id) }
        let(:initially_selected_option_ids) { question_option_ids[0, 2] }
        let(:multiple_response_answer) do
          survey_response.answers.find_by(question_id: multiple_response_question.id)
        end
        let(:response_params) do
          {
            answers_attributes: {
              id: multiple_response_answer.id,
              question_option_ids: selected_option_ids
            }
          }
        end
        let(:selected_option_ids) { [] }

        before do
          survey_response.build_missing_answers
          survey_response.save
          multiple_response_answer.question_option_ids = initially_selected_option_ids
          survey_response.save
        end

        context 'when valid options are selected' do
          let(:selected_option_ids) { [question_option_ids.last] }

          before { subject }

          it "updates the question's options" 

        end

        context 'when invalid options are selected' do
          let(:selected_option_ids) { [multiple_choice_question.options.first.id] }

          it "does not update the question's options" 

        end
      end

      context 'when the response is being submitted' do
        let(:response_params) { { submit: true } }

        context 'when the response is on time' do
          let(:survey_traits) { [:published, :currently_active, :allow_response_after_end] }

          it 'sets submitted_at and awards full points' 

        end

        context 'when the response is late' do
          let(:survey_traits) { [:published, :expired, :allow_response_after_end] }

          it 'sets submitted_at and awards base points only' 

        end
      end
    end

    describe '#unsubmit' do
      let(:user) { admin }
      let(:response_traits) { :submitted }
      let!(:response_answer) do
        create(:course_survey_answer, question: survey_question, response: survey_response)
      end
      let(:new_response_text) { response_answer.text_response + 'New Stuff' }
      let(:response_params) do
        { answer_attributes: { id: response_answer.id, text_response: new_response_text } }
      end
      subject do
        post :unsubmit, as: :json, params: {
          response: response_params,
          course_id: course.id, survey_id: survey.id, id: survey_response.id
        }
      end

      it 'unsubmits the survey response' 


      it 'does not update the answer attributes' 


      context 'when user is a student' do
        let(:user) { student.user }

        it 'raises an error' 

      end
    end
  end
end
