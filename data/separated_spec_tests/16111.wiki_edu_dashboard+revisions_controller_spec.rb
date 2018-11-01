# frozen_string_literal: true

require 'rails_helper'

describe RevisionsController do
  # This spec involves multiple course types to check the behaviour of course start/end times
  #   and how they interact with the Course.revisions scope
  describe '#index' do
    let(:course_start) { Time.new(2015, 1, 1, 0, 0, 0, '+00:00') }
    let(:course_end) { Time.new(2016, 1, 1, 20, 0, 0, '+00:00') }
    let!(:course) { create(:course, start: course_start, end: course_end.end_of_day) }
    let!(:basic_course) { create(:basic_course, start: course_start, end: course_end) }
    let!(:user) { create(:user) }
    let!(:user2) { create(:user, id: 2, username: 'user2') }
    let!(:courses_user) { create(:courses_user, course_id: course.id, user_id: user.id) }
    let!(:courses_user2) { create(:courses_user, course_id: course.id, user_id: 2) }

    let!(:article) { create(:article, mw_page_id: 1) }
    let!(:course_revisions) do
      (1..5).map do |i|
        create(:revision, article_id: article.id, mw_page_id: 1,
                          user_id: user.id, mw_rev_id: i, date: course_end - 6.hours)
      end
    end
    let!(:non_course_revisions) do
      (6..10).map do |i|
        create(:revision, article_id: article.id, mw_page_id: 1,
                          user_id: user.id, mw_rev_id: i, date: course_end.end_of_day + 1.hour)
      end
    end
    let!(:non_basic_course_revisions) do
      (11..15).map do |i|
        create(:revision, article_id: article.id, mw_page_id: 1,
                          user_id: user.id, mw_rev_id: i, date: course_end + 1.hour)
      end
    end

    let!(:non_user_revisions) do
      (16..20).map do |i|
        create(:revision, article_id: article.id, mw_page_id: 1,
                          user_id: 2, mw_rev_id: i, date: course_end - 1.day)
      end
    end
    let(:params) { { course_id: course.id, user_id: user.id, format: 'json' } }
    let(:params2) { { course_id: basic_course.id, user_id: user.id, format: 'json' } }

    it 'returns revisions that happened during the course' 


    it 'does not return revisions that happened after the last day of the course' 


    it 'does return revisions from the final day of the basic course but not after it ended' 


    it 'does not return course revisions by other users' 

  end
end
