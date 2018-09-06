# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/app/services/update_course_stats"
require "#{Rails.root}/lib/assignment_manager"

MILESTONE_BLOCK_KIND = 2

# Wait one second after loading a path
# Allows React to properly load the page
# Remove this after implementing server-side rendering
def js_visit(path, count=3)
  visit path
  expect(page).to have_content 'Explore'

# This is a workaround for some of the intermittent errors that occur when
# running capybara with xvfb, which we do on travis-ci and in vagrant.
rescue ActionController::RoutingError => e
  raise e if count < 1
  count -= 1
  js_visit(path, count)
end

user_count = 10
article_count = 19
revision_count = 214
# Dots in course titles will cause errors if routes.rb is misconfigured.
slug = 'This_university.foo/This.course_(term_2015)'
course_start = '2015-01-01'
course_end = '2015-12-31'

describe 'the course page', type: :feature, js: true do
  let(:es_wiktionary) { create(:wiki, language: 'es', project: 'wiktionary') }
  let(:home_wiki) { Wiki.get_or_create language: 'en', project: 'wikipedia' }
  let(:admin) { create(:admin) }

  before do
    stub_wiki_validation
    page.current_window.resize_to(1920, 1080)

    course = create(:course,
                    id: 10001,
                    title: 'This.course',
                    slug: slug,
                    start: course_start.to_date,
                    end: course_end.to_date,
                    timeline_start: course_start.to_date,
                    timeline_end: course_end.to_date,
                    school: 'This university.foo',
                    term: 'term 2015',
                    home_wiki_id: home_wiki.id,
                    description: 'This is a great course')
    campaign = create(:campaign)
    course.campaigns << campaign

    (1..user_count).each do |i|
      create(:user,
             id: i.to_s,
             username: "Student #{i}",
             trained: i % 2)

      create(:courses_user,
             id: i.to_s,
             course_id: 10001,
             user_id: i.to_s)
    end

    ratings = ['fl', 'fa', 'a', 'ga', 'b', 'c', 'start', 'stub', 'list', nil]
    (1..article_count).each do |i|
      create(:article,
             title: "Article #{i}",
             namespace: 0,
             wiki_id: es_wiktionary.id,
             rating: ratings[(i + 5) % 10])
    end

    # Add some revisions within the course dates
    (1..revision_count).each do |i|
      # Make half of the articles new ones.
      newness = i <= article_count ? i % 2 : 0

      create(:revision,
             id: i.to_s,
             user_id: ((i % user_count) + 1).to_s,
             article_id: ((i % article_count) + 1).to_s,
             date: '2015-03-01'.to_date,
             characters: 2,
             views: 10,
             new_article: newness)
    end

    # Add articles / revisions before the course starts and after it ends.
    create(:article,
           title: 'Before',
           namespace: 0)
    create(:article,
           title: 'After',
           namespace: 0)
    create(:revision,
           id: (revision_count + 1).to_s,
           user_id: 1,
           article_id: (article_count + 1).to_s,
           date: '2014-12-31'.to_date,
           characters: 9000,
           views: 9999,
           new_article: 1)
    create(:revision,
           id: (revision_count + 2).to_s,
           user_id: 1,
           article_id: (article_count + 2).to_s,
           date: '2016-01-01'.to_date,
           characters: 9000,
           views: 9999,
           new_article: 1)

    week = create(:week,
                  course_id: course.id)
    create(:block,
           kind: MILESTONE_BLOCK_KIND,
           week_id: week.id,
           content: 'blocky block')

    ArticlesCourses.update_from_course(Course.last)
    ArticlesCourses.update_all_caches(Course.last.articles_courses)
    CoursesUsers.update_all_caches(CoursesUsers.ready_for_update)
    Course.update_all_caches

    stub_token_request
  end

  describe 'overview' do
    it 'displays title, tab links, stats, description, school, term, dates, milestones' 

  end

  describe 'overview details editing' do
    it "doesn't allow null values for passcode" 


    context 'when WikiEd Feature disabled' do
      before { allow(Features).to receive(:wiki_ed?).and_return(false) }
      it 'allow edits for home_wiki' 

    end
  end

  describe 'articles edited view' do
    it 'displays a list of articles, and sort articles by class' 


    it 'includes a list of available articles' 


    it 'does not show an "Add an available article" button for students' 


    it 'shows an "Add an available article" button for instructors/admins' 


    it 'allow instructor to add an available article' 


    it 'allows instructor to remove an available article' 


    it 'allows student to select an available article' 

  end

  describe 'students view' do
    before do
      Revision.last.update_attributes(date: 2.days.ago, user_id: User.first.id)
      CoursesUsers.last.update_attributes(
        course_id: Course.find_by(slug: slug).id,
        user_id: User.first.id
      )
      CoursesUsers.update_all_caches CoursesUsers.all
    end
    it 'shows a number of most recent revisions for a student' 

  end

  describe 'uploads view' do
    it 'should display a list of uploads' 

  end

  describe 'activity view' do
    it 'should display a list of edits' 

  end

  describe '/manual_update' do
    it 'should update the course cache' 

  end

  describe 'timeline' do
    it 'does not show authenticated links to a logged out user' 

  end
end

