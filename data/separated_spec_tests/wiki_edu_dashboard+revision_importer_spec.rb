# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/revision_importer"
require "#{Rails.root}/lib/articles_courses_cleaner"

describe RevisionImporter do
  describe '.users_with_no_revisions' do
    let(:user)      { create(:user) }
    let(:course_1)  { create(:course, start: '2015-01-01', end: '2015-12-31') }
    let(:course_2)  { create(:course, start: '2016-01-01', end: '2016-12-31', slug: 'foo/course2') }

    let!(:cu) do
      create(:courses_user, course_id: course_1.id, user_id: user.id,
                            role: CoursesUsers::Roles::STUDENT_ROLE)
    end
    let!(:cu2) do
      create(:courses_user, course_id: course_2.id, user_id: user.id,
                            role: CoursesUsers::Roles::STUDENT_ROLE)
    end

    let(:article)   { create(:article) }
    let!(:revision) do
      create(:revision, user_id: user.id, article_id: article.id, date: course_1.start + 1.month)
    end

    before { CoursesUsers.all.collect(&:update_cache) }

    it 'returns users who have no revisions for the given course' 


    it 'does not return users who have revisions for the course' 

  end

  describe '#import_new_revisions_for_course' do
    let(:zh_wiki) { Wiki.new(language: 'zh', project: 'wikipedia', id: 999) }
    let(:course) { create(:course, start: '2018-05-26', end: '2018-05-27') }
    let(:subject) { described_class.new(zh_wiki, course).import_new_revisions_for_course }
    let(:user) { create(:user, username: '-Zest') }

    before do
      create(:courses_user, course: course, user: user)
    end
    # Workaround for # https://github.com/WikiEducationFoundation/WikiEduDashboard/issues/1744

    it 'handles revisions with four-byte unicode characters' 

  end
end

