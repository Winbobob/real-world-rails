# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::LessonPlan::ItemsController, type: :controller do
  let(:instance_traits) { nil }
  let!(:instance) { create(:instance, *instance_traits) }

  with_tenant(:instance) do
    let(:admin) { create(:administrator) }
    let(:course_traits) { nil }
    let(:course) { create(:course, *course_traits, creator: admin) }
    let(:student) { create(:course_student, course: course) }

    before { sign_in(user) }

    describe '#index' do
      subject { get :index, params: { course_id: course.id } }

      context 'when survey component is disabled' do
        let(:user) { admin }
        before do
          allow(controller).
            to receive_message_chain('current_component_host.[]').and_return(nil)
        end

        it 'raises an component not found error' 

      end

      context 'when json data is requested' do
        render_views
        let(:json_response) { JSON.parse(response.body) }
        let!(:milestone) { create(:course_lesson_plan_milestone, course: course) }
        let!(:item) { create(:course_lesson_plan_event, course: course) }
        let!(:published_item) do
          create(:course_lesson_plan_event, published: true, course: course)
        end

        subject { get :index, params: { format: :json, course_id: course.id } }

        context 'when user is staff' do
          let(:user) { admin }

          it 'responds with all items' 


          context 'when the video component is enabled' do
            let!(:video) { create(:video, course: course) }
            let(:instance_traits) { :with_video_component_enabled }
            let(:course_traits) { :with_video_component_enabled }

            it 'responds with the list of videos' 

          end

          context 'when the course has assessments' do
            let!(:assessment) { create(:course_assessment_assessment, course: course) }
            let(:tab) { assessment.tab }

            context 'when the assessment tab is enabled for display' do
              it 'responds including the assessment data' 

            end

            context 'when the assessment tab is disabled for display' do
              before do
                course.settings(:course_assessments_component, :lesson_plan_items, "tab_#{tab.id}").enabled = false
                course.save!
              end

              it 'responds without the assessment data' 

            end
          end

          context 'when the video component is disabled on the course' do
            let(:instance_traits) { :with_video_component_enabled }
            let!(:video) { create(:video, course: course) }

            it 'responds with the list of items, excluding videos' 

          end

          context 'when the video component is disabled on the instance' do
            let!(:video) { create(:video, course: course) }

            it 'responds with the list of items, excluding videos' 

          end
        end

        context 'when user is student' do
          let(:user) { student.user }

          it 'responds with published items only' 

        end
      end
    end
  end
end

