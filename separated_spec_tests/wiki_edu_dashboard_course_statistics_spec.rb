# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/analytics/course_statistics"

describe CourseStatistics do
  let(:course_ids) { [1, 2, 3, 10001, 10002, 10003] }
  before do
    course_ids.each do |i|
      # Course
      id = i
      id2 = id + 100
      create(:course, id: id, start: 1.year.ago, end: Time.zone.today, slug: "foo/#{id}")
      # First user in course working within course dates
      create(:user, id: id, username: "user#{id}")
      create(:courses_user, id: id, user_id: id, course_id: id, role: 0)
      create(:revision, date: 1.day.ago, article_id: id, user_id: id, characters: 1000)
      create(:article, id: id, title: "Article_#{id}", namespace: Article::Namespaces::MAINSPACE)
      create(:commons_upload, id: id, user_id: id, uploaded_at: 1.day.ago, usage_count: 1)

      # Second user in course working outside course dates
      create(:user, id: id2, username: "second_user#{id}")
      create(:courses_user, id: id2, user_id: id2, course_id: id2, role: 0)
      create(:revision, date: 2.years.ago, article_id: id2, user_id: id2)
      create(:article, id: id2, title: "Article_#{id2}")
      create(:commons_upload, id: id2, user_id: id2, uploaded_at: 2.years.ago, usage_count: 1)
      CoursesUsers.update_all_caches(CoursesUsers.ready_for_update)
    end
  end

  describe '#report_statistics' do
    it 'should work for empty campaigns' 


    let(:subject) { CourseStatistics.new(course_ids).report_statistics }

    it 'should count articles, revisions and uploads from during courses' 

  end

  describe '#articles_edited' do
    it 'should work for empty campaigns' 


    it 'should return articles edited during courses' 

  end
end
