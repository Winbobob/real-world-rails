# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/alerts/ga_nomination_monitor"

def mock_mailer
  OpenStruct.new(deliver_now: true)
end

describe GANominationMonitor do
  describe '.create_alerts_for_course_articles' do
    let(:course) { create(:course) }
    let(:student) { create(:user, username: 'student') }
    let(:courses_user) do
      create(:courses_user, user_id: student.id,
                            course_id: course.id,
                            role: CoursesUsers::Roles::STUDENT_ROLE)
    end
    let(:content_expert) { create(:user, greeter: true) }

    # Article that hasn't been edited by students
    let!(:article2) { create(:article, title: '17776', namespace: 0) }

    # Good Article article
    let(:article) { create(:article, title: 'Be_Here_Now_(George_Harrison_song)', namespace: 0) }
    let(:revision) do
      create(:revision, article_id: article.id,
                        user_id: student.id,
                        date: course.start + 1.day)
    end
    let(:articles_course) do
      create(:articles_course, article_id: article.id,
                               course_id: course.id)
    end

    before do
      allow_any_instance_of(CategoryImporter).to receive(:page_titles_for_category)
        .with('Category:Good article nominees', 0)
        .and_return(['Talk:Be Here Now (George Harrison song)',
                     'Talk:2017–18 London & South East Premier',
                     'Talk:17776'])

      articles_course && revision && courses_user
    end

    it 'creates an Alert record for the edited article' 


    it 'emails a content expert' 


    it 'does not create a second Alert for the same articles' 


    it 'does create second Alert if the first alert is resolved' 

  end
end

