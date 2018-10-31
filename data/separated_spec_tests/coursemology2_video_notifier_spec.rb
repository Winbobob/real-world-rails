# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::VideoNotifier, type: :notifier do
  let!(:instance) { Instance.default }

  with_tenant(:instance) do
    describe '#video_attempted' do
      let(:course) { create(:course) }
      let!(:video) { create(:video, course: course) }
      let!(:user) { create(:course_user, course: course).user }

      subject { Course::VideoNotifier.video_attempted(user, video) }

      it 'sends a course notification' 

    end

    describe '#video_closing' do
      let!(:now) { Time.zone.now }
      let(:activity) { Activity.find_by(object: video, event: :closing, actor: user) }

      let(:course) { create(:course) }
      let!(:video) { create(:course_video, course: course, end_at: now) }
      let(:user) { create(:course_manager, course: course).user }
      let!(:submitted_student) { create(:course_student, course: course) }
      let!(:unsubmitted_student) { create(:course_student, course: course) }
      let!(:video_submission) do
        create(:video_submission, course: course, video: video, creator: submitted_student.user)
      end

      subject { Course::VideoNotifier.video_closing(user, video) }

      it 'sends a user notification' 


      it 'sends an email notification to students who have not attempted it' 


      it 'creates an activity' 


      context 'when email notification for video closing is disabled' do
        before do
          context = OpenStruct.new(key: Course::VideosComponent.key, current_course: course)
          Course::Settings::VideosComponent.new(context).
            update_email_setting('key' => 'video_closing', 'enabled' => false)
          course.save!
        end

        it 'does not send a user notification' 


        it 'does not send an email notification' 

      end
    end
  end
end

