# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/analytics/course_students_csv_builder"

describe CourseStudentsCsvBuilder do
  let(:course) { create(:course) }
  let(:user) { create(:user, registered_at: course.start + 1.minute) }
  let!(:courses_user) { create(:courses_user, course: course, user: user) }
  let(:subject) { described_class.new(course).generate_csv }

  it 'creates a CSV with a header and a row of data for each student' 

end

