# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/course_upload_importer"

describe CourseUploadImporter do
  let(:course) do
    create(:course, start: '2018-03-07'.to_date, end: '2018-03-11'.to_date)
  end
  let(:user) { create(:user, username: 'Kippelboy') }

  before do
    create(:courses_user, user: user, course: course)
  end

  describe '.update_courses' do
    it 'imports uploads with thumburls and usage counts for the courses' 

  end
end

