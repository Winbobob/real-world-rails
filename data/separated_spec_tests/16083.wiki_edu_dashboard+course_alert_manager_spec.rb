# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/alerts/course_alert_manager"

def mock_mailer
  OpenStruct.new(deliver_now: true)
end

describe CourseAlertManager do
  let(:subject) { described_class.new }

  let(:course) do
    create(:course, start: course_start,
                    timeline_start: course_start,
                    timeline_end: course_end,
                    end: course_end,
                    weekdays: '0101010')
  end
  let(:course_start) { 16.days.ago }
  let(:course_end) { 1.month.from_now }
  let(:admin) { create(:admin, email: 'staff@wikiedu.org') }
  let(:user) { create(:user) }

  let(:enroll_admin) do
    create(:courses_user,
           course: course,
           user: admin,
           role: CoursesUsers::Roles::WIKI_ED_STAFF_ROLE)
  end
  let(:enroll_student) do
    create(:courses_user,
           course: course,
           user: user,
           role: CoursesUsers::Roles::STUDENT_ROLE)
  end

  before do
    enroll_admin
  end

  describe '#create_no_students_alerts' do
    before do
      # These alerts are only created if the course is approved.
      create(:campaigns_course, course: course, campaign: Campaign.first)
    end

    it 'creates an Alert record and emails a greeter' 


    it 'does not create a second Alert for the same course' 

  end

  describe '#create_untrained_students_alerts' do
    let(:course_start) { 2.months.ago }

    context 'when a course has no students' do
      it 'does not create an alert' 

    end

    context 'when a course has no training modules' do
      before do
        enroll_student
        course.update_cache
      end

      it 'does not create an alert' 

    end

    context 'when a course has a training module that is long overdue' do
      before do
        week = Week.new
        week.blocks << Block.new(training_module_ids: [1, 2, 3])
        course.weeks << week
        create(:courses_user,
               course: course,
               user: user,
               role: CoursesUsers::Roles::STUDENT_ROLE)
        create(:campaigns_course, course: course, campaign: Campaign.first)
        course.update_cache
      end

      it 'creates an alert' 

    end
  end

  describe '#create_productive_course_alerts' do
    it 'calls "create_alerts" on ProductiveCourseAlertManager' 

  end

  describe '#create_continued_course_activity_alerts' do
    it 'calls "create_alerts" on ContinuedCourseActivityAlertManager' 

  end

  describe '#create_active_course_alerts' do
    it 'calls "create_alerts" on ActiveCourseAlertManager' 

  end

  describe '#create_deleted_uploads_alerts' do
    it 'calls "create_alerts" on DeletedUploadsAlertManager' 

  end
end

