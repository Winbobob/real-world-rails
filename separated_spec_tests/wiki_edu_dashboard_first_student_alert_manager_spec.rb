# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/alerts/first_student_alert_manager"

describe FirstStudentAlertManager do
  let(:course) { create(:course) }
  let(:instructor) { create(:user, email: 'teach@wiki.edu') }
  let(:student) { create(:user, username: 'Student') }
  let(:subject) { FirstStudentAlertManager.new([course]) }

  before do
    create(:user, username: 'Eryk (Wiki Ed)', email: 'eryk@wikiedu.org')
    create(:setting, key: 'special_users', value: { communications_manager: 'Eryk (Wiki Ed)' })
    create(:courses_user, user: instructor, course: course,
                          role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
  end

  context 'when there are no users' do
    it 'does not create an alert' 

  end

  context 'when the first student joined recently' do
    before do
      create(:courses_user, user: student, course: course,
                            role: CoursesUsers::Roles::STUDENT_ROLE)
    end
    it 'creates an alert' 

  end

  context 'when the first student joined 4 days ago' do
    before do
      create(:courses_user, user: student, course: course,
                            role: CoursesUsers::Roles::STUDENT_ROLE,
                            created_at: 4.days.ago)
    end
    it 'does not create an alert' 

  end

  context 'when there is already an alert' do
    before do
      create(:courses_user, user: student, course: course,
                            role: CoursesUsers::Roles::STUDENT_ROLE)
    end
    before { create(:alert, type: 'FirstEnrolledStudentAlert', course_id: course.id) }

    it 'does not create an alert' 

  end
end
