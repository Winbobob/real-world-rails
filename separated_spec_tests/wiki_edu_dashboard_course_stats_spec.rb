# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/course_training_progress_manager"

describe 'course stats', type: :feature, js: true do
  let(:trained)    { 1 }
  let(:course)     do
    create(:course, trained_count: trained,
                    start: CourseTrainingProgressManager::TRAINING_BOOLEAN_CUTOFF_DATE + 1.day,
                    end: 1.year.from_now.to_date)
  end
  let(:views)      { 10 }
  let(:chars)      { 10 }
  let(:student)    { 0 }
  let(:article)    { create(:article, namespace: 0) }
  let!(:ac)        do
    create(:articles_course, course_id: course.id, article_id: article.id,
                             new_article: true, view_count: views)
  end
  let(:revision) do
    create(:revision, article_id: article.id, characters: chars,
                      date: course.start + 1.day, user_id: user.id)
  end
  let(:revision2) do
    create(:revision, article_id: article.id, new_article: true,
                      characters: chars, date: course.start + 1.day, user_id: user.id)
  end
  let(:user)       { create(:user) }
  let!(:cu)        { create(:courses_user, course_id: course.id, user_id: user.id, role: student) }

  let!(:revisions) { [revision, revision2] }
  let(:articles)   { [article] }
  let(:users)      { [user] }

  it 'displays statistics about the course' 

end

