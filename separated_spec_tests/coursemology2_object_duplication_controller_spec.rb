# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::ObjectDuplicationsController do
  let(:admin) { create(:administrator) }
  let(:json_response) { JSON.parse(response.body) }
  let(:instance) { Instance.default }
  let(:other_instance) { create(:instance) }
  let!(:other_instance_course) do
    ActsAsTenant.with_tenant(other_instance) { create(:course, creator: admin) }
  end

  with_tenant(:instance) do
    let(:course) { create(:course, creator: admin) }
    let(:assessment) { create(:course_assessment_assessment, course: course) }
    let(:unenrolled_course) { create(:course) }
    let(:unenrolled_course_assessment) { create(:course_assessment_assessment, course: unenrolled_course) }

    let(:user) { admin }
    before { sign_in(user) }

    describe '#new' do
      render_views

      subject { get :new, format: :json, params: { course_id: course.id } }
      before { subject }

      it "includes user's courses from other instances in destinationCourses" 

    end

    describe '#create' do
      subject do
        post :create, as: :json, params: {
          course_id: course.id, object_duplication: {
            destination_course_id: other_instance_course.id, items: items_params
          }
        }
      end

      context 'when valid parameters are provided' do
        let(:items_params) { { 'ASSESSMENT' => [assessment.id] } }

        it 'duplicates selected items' 

      end

      context 'when invalid assessment id is provided' do
        let(:items_params) { { 'ASSESSMENT' => [unenrolled_course_assessment.id] } }

        it 'does not duplicate selected item' 

      end

      context 'when virtual folder id is provided but not its owner' do
        let(:items_params) { { 'FOLDER' => [assessment.folder.id] } }

        it 'does not duplicate selected item' 

      end
    end
  end
end

