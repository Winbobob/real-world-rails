# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/course_revision_updater"

describe CourseRevisionUpdater do
  describe 'imported revisions and articles' do
    let(:course) { create(:course, id: 1, start: '2016-03-20', end: '2016-03-31') }
    let(:user) { create(:user, username: 'Tedholtby') }
    let(:courses_user) do
      create(:courses_user, course_id: 1, user_id: user.id,
                            role: CoursesUsers::Roles::STUDENT_ROLE)
    end

    let(:revision_import) do
      course && user && courses_user
      described_class.import_new_revisions(Course.all)
    end

    it 'includes the correct article and revision data' 


    it 'updates article title if it does not match existing article record' 

  end

  describe '.import_new_revisions' do
    it 'includes revisions on the final day of a course up to the end time' 


    it 'imports revisions soon after the final day of the course, but excludes them from metrics' 


    it 'handles returning users with earlier revisions' 

  end

  describe '.import_new_revisions_concurrently' do
    let!(:course) { create(:course) }

    it 'calls import_new_revisions multiple times' 

  end

  describe '#default_wiki_ids' do
    it 'includes wikidata for Programs & Events Dashboard' 

  end
end

