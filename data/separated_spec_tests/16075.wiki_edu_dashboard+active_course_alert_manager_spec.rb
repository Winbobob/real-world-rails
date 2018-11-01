# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/alerts/active_course_alert_manager"

def mock_mailer
  OpenStruct.new(deliver_now: true)
end

describe ActiveCourseAlertManager do
  let(:course) { create(:course, user_count: user_count, character_sum: character_sum) }
  let(:instructor) { create(:user, email: 'teach@wiki.edu') }
  let(:subject) { described_class.new([course]) }

  before do
    create(:user, username: 'Eryk (Wiki Ed)', email: 'eryk@wikiedu.org')
    create(:setting, key: 'special_users', value: { communications_manager: 'Eryk (Wiki Ed)' })
    create(:courses_user, user: instructor, course: course,
                          role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
  end

  context 'when there are no users' do
    let(:user_count) { 0 }
    let(:character_sum) { 0 }

    it 'does not create an alert' 

  end

  context 'when user productivity is low' do
    let(:user_count) { 5 }
    let(:character_sum) { 100 }

    it 'does not create an alert' 

  end

  context 'when user productivity is high' do
    let(:user_count) { 5 }
    let(:character_sum) { 50_000 }

    it 'creates an alert and sends email both via alert and via ActiveCourseMailer' 

  end

  context 'when productivity is high but there is already an alert' do
    let(:user_count) { 5 }
    let(:character_sum) { 50_000 }

    before { create(:alert, type: 'ActiveCourseAlert', course_id: course.id) }

    it 'does not create an alert' 

  end
end
