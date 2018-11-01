# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/wiki_course_edits"
require "#{Rails.root}/lib/wiki_preferences_manager"

describe SelfEnrollmentController do
  describe '#enroll_self' do
    subject { response.status }

    let(:course) { create(:course, end: Time.zone.today + 1.week) }
    let(:request_params) do
      { course_id: course.slug, passcode: course.passcode, titleterm: 'foobar' }
    end
    let(:user) { create(:user) }

    before do
      allow_any_instance_of(WikiCourseEdits).to receive(:update_course)
      allow_any_instance_of(WikiCourseEdits).to receive(:update_assignments)
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'GET' do
      context 'when the course is not approved' do
        # Course is not in any campaigns, so enrollment will fail.
        it 'redirects without enrolling the user' 

      end

      context 'when the course is approved' do
        before do
          course.campaigns << Campaign.first
          stub_add_user_to_channel_success
        end

        context 'when the user is not enrolled yet' do
          it 'enrolls user (and redirects) and updates the user count' 

        end

        context 'when type is ClassroomProgramCourse' do
          context 'when the user is enrolled as an instructor' do
            before do
              create(:courses_user,
                     course_id: course.id,
                     user_id: user.id,
                     role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
            end

            it 'redirects without enrolling the user' 

          end
        end

        context 'when type is Editathon' do
          let(:course) { create(:editathon, end: Time.zone.today + 1.week) }

          context 'when the user is enrolled as a facilitator' do
            before do
              create(:courses_user,
                     course_id: course.id,
                     user_id: user.id,
                     role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
            end

            it 'enrolls user (and redirects) and updates the user count' 

          end
        end

        context 'when the course has already ended' do
          let(:course) { create(:course, end: 1.day.ago) }

          it 'redirects without enrolling the user' 

        end
      end
    end

    # This is the HTTP verb that MS Word links use (for some reason)
    context 'HEAD' do
      it "doesn't error" 

    end

    context 'when a user is not logged in' do
      before do
        allow(controller).to receive(:current_user).and_return(nil)
      end

      it 'redirects to mediawiki for OAuth' 

    end
  end
end

