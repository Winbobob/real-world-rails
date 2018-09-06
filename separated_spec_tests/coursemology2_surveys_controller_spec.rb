# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Survey::SurveysController do
  let!(:instance) { Instance.default }

  with_tenant(:instance) do
    let(:admin) { create(:administrator) }
    let!(:course) { create(:course, creator: admin) }
    let(:student) { create(:course_student, course: course) }
    let(:manager) { create(:course_manager, course: course) }
    let!(:survey) do
      create(:survey, *survey_traits,
             course: course, section_count: 2, section_traits: [:with_all_question_types])
    end
    let(:survey_traits) { nil }
    let(:student_response) do
      create(:response, *response_traits,
             survey: survey, creator: student.user, course_user: student)
    end
    let(:response_traits) { nil }
    let(:survey_stub) do
      stub = create(:survey, course: course)
      allow(stub).to receive(:save).and_return(false)
      allow(stub).to receive(:update_attributes).and_return(false)
      allow(stub).to receive(:destroy).and_return(false)
      stub
    end
    let(:json_response) { JSON.parse(response.body) }

    before { sign_in(user) }

    describe '#index' do
      let!(:published_survey) { create(:survey, :published, course: course) }

      context 'when html page is requested' do
        let(:user) { student.user }
        subject { get :index, params: { course_id: course.id } }

        it { is_expected.to render_template('index') }

        context 'when survey component is disabled' do
          before do
            allow(controller).
              to receive_message_chain('current_component_host.[]').and_return(nil)
          end

          it 'raises an component not found error' 

        end
      end

      context 'when json data is requested' do
        render_views
        subject { get :index, as: :json, params: { course_id: course.id } }
        before { subject }

        context 'when user is staff' do
          let(:user) { admin }

          it 'sees all surveys' 

        end

        context 'when user is student' do
          let(:user) { student.user }

          it 'sees only published surveys' 

        end
      end
    end

    describe '#create' do
      let(:user) { admin }

      subject do
        post :create, as: :json, params: {
          course_id: course.id, id: survey.id, survey: attributes_for(:survey)
        }
      end

      it 'creates a survey' 


      context 'when saving fails' do
        before do
          controller.instance_variable_set(:@survey, survey_stub)
          subject
        end

        it { is_expected.to have_http_status(:bad_request) }
      end
    end

    describe '#show' do
      let(:survey_traits) { :published }

      context 'when html page is requested' do
        let(:user) { student.user }
        subject { get :show, params: { course_id: course.id, id: survey.id } }

        it { is_expected.to render_template('index') }
      end

      context 'when json data is requested' do
        render_views
        let(:user) { manager.user }
        let(:manager_response) do
          create(:response, survey: survey, creator: manager.user, course_user: manager)
        end

        subject { get :show, as: :json, params: { course_id: course.id, id: survey.id } }
        before do
          manager_response
          subject
        end

        it 'responds with the necessary fields' 

      end
    end

    describe '#update' do
      let(:user) { admin }

      subject do
        patch :update, as: :json, params: {
          course_id: course.id, id: survey.id,
          survey: survey_params
        }
      end

      context 'when survey is anonymous' do
        let(:survey_traits) { :anonymous }
        let(:survey_params) { attributes_for(:survey).merge(anonymous: false) }

        context 'when survey has no responses' do
          before { subject }

          it 'allows anonymous flag to be turned off' 

        end

        context 'when survey has a student response' do
          before do
            student_response
            subject
          end

          it 'does not allow anonymous flag to be turned off' 

        end
      end

      context 'when updating fails' do
        let(:survey_params) { attributes_for(:survey) }

        before do
          controller.instance_variable_set(:@survey, survey_stub)
          subject
        end

        it { is_expected.to have_http_status(:bad_request) }
      end
    end

    describe '#destroy' do
      let(:user) { admin }
      subject { delete :destroy, as: :json, params: { course_id: course.id, id: survey.id } }

      context 'when destroy succeeds' do
        it 'removes the deleted survey' 

      end

      context 'when destroy fails' do
        before do
          controller.instance_variable_set(:@survey, survey_stub)
          subject
        end

        it { is_expected.to have_http_status(:bad_request) }
      end
    end

    describe '#results' do
      let(:user) { admin }

      context 'when html page is requested' do
        subject { get :results, params: { course_id: course.id, id: survey.id } }

        it { is_expected.to render_template('index') }
      end

      context 'when json data is requested' do
        render_views
        let(:response_traits) { :submitted }

        subject { get :results, as: :json, params: { course_id: course.id, id: survey.id } }
        before do
          student_response.build_missing_answers
          student_response.save!
          subject
        end

        it 'responds with the necessary fields' 

      end
    end

    describe '#remind' do
      let(:user) { admin }
      let(:survey_traits) { :currently_active }

      subject { post :remind, as: :json, params: { course_id: course.id, id: survey.id } }

      it 'sends reminder to students' 

    end

    describe '#reorder_sections' do
      let(:user) { admin }

      subject do
        post :reorder_sections,
             as: :json, params: { course_id: course.id, id: survey.id, ordering: ordering }
      end

      before { subject }

      context 'when new ordering is valid' do
        let(:ordering) { survey.sections.order(weight: :asc).pluck(:id).reverse }

        it 'persists the ordering' 

      end

      context 'when new ordering contains an invalid section id' do
        let(:ordering) do
          current_ordering = survey.sections.order(weight: :asc).pluck(:id)
          invalid_id = current_ordering.max + 1
          current_ordering << invalid_id
        end

        it { is_expected.to have_http_status(:bad_request) }
      end

      context 'when new ordering contains duplicate section ids' do
        let(:ordering) do
          current_ordering = survey.sections.order(weight: :asc).pluck(:id)
          current_ordering << current_ordering.last
        end

        it { is_expected.to have_http_status(:bad_request) }
      end
    end

    describe '#reorder_questions' do
      let(:user) { admin }
      let(:section_ids) { survey.sections.pluck(:id) }
      let(:question_ids) { survey.questions.pluck(:id) }

      subject do
        post :reorder_questions,
             as: :json, params: { course_id: course.id, id: survey.id, ordering: ordering }
      end
      before { subject }

      context 'when new ordering is valid' do
        let(:ordering) { [[section_ids.first, question_ids], [section_ids.last, []]] }

        it 'persists the ordering' 

      end

      context 'when new ordering is invalid' do
        let(:ordering) { [[section_ids.first, [question_ids.first]]] }
        it { is_expected.to have_http_status(:bad_request) }
      end
    end
  end
end

