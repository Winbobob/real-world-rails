# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/data_cycle/schedule_course_updates"

describe ScheduleCourseUpdates do
  describe 'on initialization' do
    before do
      create(:editathon, start: 1.day.ago, end: 2.hours.from_now,
                         slug: 'ArtFeminism/Test_Editathon')
      create(:course, start: 1.day.ago, end: 2.months.from_now,
                      slug: 'Medium/Course', needs_update: true)
      create(:course, start: 1.day.ago, end: 1.year.from_now,
                      slug: 'Long/Program')
    end

    it 'calls the revisions and articles updates on courses currently taking place' 


    it 'clears the needs_update flag from courses' 


    it 'reports logs to sentry even when it errors out' 

  end
end

