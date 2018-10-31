# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Question::ScribingController do
  render_views
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:user) { create(:user) }
    let(:course) { create(:course, creator: user) }
    let(:assessment) { create(:assessment, course: course) }
    let(:scribing_question) { nil }
    let(:question_scribing_attributes) do
      attributes_for(:course_assessment_question_scribing).
        slice(:title, :description, :staff_only_comments, :maximum_grade, :file)
    end
    let(:question_scribing_update_attributes) do
      attributes_for(:course_assessment_question_scribing).
        slice(:title, :description, :staff_only_comments, :maximum_grade)
    end
    let(:immutable_scribing_question) do
      create(:course_assessment_question_scribing, assessment: assessment).tap do |question|
        allow(question).to receive(:save).and_return(false)
        allow(question).to receive(:destroy).and_return(false)
      end
    end

    before do
      sign_in(user)
      controller.instance_variable_set(:@scribing_question, scribing_question)
    end

    describe '#create' do
      subject do
        request.accept = 'application/json'
        post :create, params: {
          course_id: course, assessment_id: assessment,
          question_scribing: question_scribing_attributes
        }
      end

      context 'when saving fails' do
        let(:scribing_question) { immutable_scribing_question }

        it 'returns the correct status' 


        it 'returns the correct failure message' 

      end

      context 'when attaching an image attachment' do
        let(:question_scribing_attributes) do
          attributes_for(:course_assessment_question_scribing).
            slice(:title, :description, :maximum_grade, :file).tap do |result|
            result[:file] = fixture_file_upload('files/picture.jpg', 'image/jpeg')
          end
        end

        it 'returns the correct attachment' 

      end

      context 'when attaching a pdf attachment' do
        let(:question_scribing_attributes) do
          attributes_for(:course_assessment_question_scribing).
            slice(:title, :description, :maximum_grade, :file).tap do |result|
            result[:file] = fixture_file_upload(file_path, 'application/pdf')
          end
        end

        context 'when the pdf is one page' do
          let(:file_path) { 'files/one-page-document.pdf' }
          it 'creates one scribing question with a png attachment' 

        end

        context 'when the pdf is two pages' do
          let(:file_path) { 'files/two-page-document.pdf' }
          it 'creates one scribing question with a png attachment for each pdf page' 

        end
      end
    end

    describe '#update' do
      subject do
        request.accept = 'application/json'
        patch :update, params: {
          course_id: course, assessment_id: assessment, id: scribing_question,
          question_scribing: question_scribing_update_attributes
        }
      end

      context 'when the question cannot be saved' do
        let(:scribing_question) { immutable_scribing_question }

        it 'returns the correct status' 


        it 'returns the correct failure message' 

      end
    end

    describe '#destroy' do
      subject { post :destroy, params: { course_id: course, assessment_id: assessment, id: scribing_question } }

      context 'when question is destroyed' do
        let!(:scribing_question) do
          create(:course_assessment_question_scribing, assessment: assessment)
        end

        it { is_expected.to redirect_to(course_assessment_path(course, assessment)) }
      end

      context 'when the question cannot be destroyed' do
        let(:scribing_question) { immutable_scribing_question }

        it { is_expected.to redirect_to(course_assessment_path(course, assessment)) }
        it 'sets the correct flash message' 

      end
    end
  end
end

