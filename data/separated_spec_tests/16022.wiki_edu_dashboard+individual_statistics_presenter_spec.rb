# frozen_string_literal: true

require 'rails_helper'
require_relative '../../app/presenters/individual_statistics_presenter'

describe IndividualStatisticsPresenter do
  describe 'individual_article_views' do
    subject { described_class.new(user: user) }

    let(:course1) { create(:course) }
    let(:course2) { create(:course, slug: 'foo/2') }
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    context 'when a user is in two courses that overlap' do
      before do
        create(:courses_user, user_id: user.id, course_id: course1.id)
        create(:courses_user, user_id: user.id, course_id: course2.id)
        create(:commons_upload, user_id: user.id, usage_count: 1,
                                uploaded_at: course1.start + 1.minute)
        create(:revision, views: 100, user_id: user.id, article_id: article.id,
                          date: course1.start + 1.minute, new_article: true, characters: 100)
        ArticlesCourses.update_from_course(course1)
        ArticlesCourses.update_from_course(course2)
        CoursesUsers.update_all_caches(CoursesUsers.all)
      end

      it 'does\'t double count the same articles or revisions in multiple courses' 


      it 'does not double count upload stats' 

    end

    context 'when there are revisions made before the course started ' do
      before do
        create(:courses_user, user_id: user.id, course_id: course1.id)
        create(:courses_user, user_id: user.id, course_id: course2.id)
        create(:revision, views: 100, user_id: user.id, article_id: article.id,
                          date: course1.start + 1.minute)
        create(:revision, views: 150, user_id: user.id, article_id: article.id,
                          date: course1.start - 1.minute)
        ArticlesCourses.update_from_course(course1)
        ArticlesCourses.update_from_course(course2)
      end

      it 'only counts views for revisions that happen during a course' 

    end
  end
end
