# frozen_string_literal: true

require 'rails_helper'

describe 'cloning a course', js: true do
  before do
    page.current_window.resize_to(1920, 1920)
    stub_oauth_edit
  end
  # This is super hacky to work around a combination of bugginess in the modal
  # and bugginess in the Capybara drivers. We want to avoid setting a date the
  # same as today's date.
  if (11..12).cover? Date.today.day
    let(:course_start) { '13' }
    let(:timeline_start) { '14' }
  else
    let(:course_start) { '11' }
    let(:timeline_start) { '12' }
  end

  if (27..28).cover? Date.today.day
    let(:course_end) { '26' }
    let(:timeline_end) { '25' }
  else
    let(:course_end) { '28' }
    let(:timeline_end) { '27' }
  end

  let!(:course) do
    create(:course, start: 1.year.from_now.to_date,
                    title: 'CourseToClone',
                    school: 'OriginalSchool',
                    term: 'OriginalTerm',
                    slug: 'OriginalSchool/CourseToClone_(OriginalTerm)',
                    subject: 'OrginalSubject',
                    end: 2.years.from_now.to_date, submitted: true,
                    expected_students: 0)
  end
  let!(:week)      { create(:week, course_id: course.id) }
  let!(:block)     { create(:block, week_id: week.id, due_date: course.start + 3.months) }
  let!(:gradeable) do
    create(:gradeable, gradeable_item_type: 'block', gradeable_item_id: block.id, points: 10)
  end
  let!(:user)      { create(:user, permissions: User::Permissions::ADMIN) }
  let!(:c_user)    { create(:courses_user, course_id: course.id, user_id: user.id) }
  let(:new_term) { 'Spring2016' }
  let(:subject) { 'Advanced Foo' }

  it 'copies relevant attributes of an existing course' 


  after do
    logout
  end
end

