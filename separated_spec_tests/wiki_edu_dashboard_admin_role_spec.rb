# frozen_string_literal: true

require 'rails_helper'

describe 'Admin users', type: :feature, js: true do
  before do
    page.current_window.resize_to(1920, 1080)
    page.driver.browser.url_blacklist = ['https://wikiedu.org']
  end

  before :each do
    create(:user,
           id: 100,
           username: 'Professor Sage')

    create(:course,
           id: 10001,
           title: 'My Submitted Course',
           school: 'University',
           term: 'Term',
           slug: 'University/Course_(Term)',
           submitted: true,
           passcode: 'passcode',
           start: '2015-01-01'.to_date,
           end: '2020-01-01'.to_date)
    create(:courses_user,
           user_id: 100,
           course_id: 10001,
           role: 1)

    create(:course,
           id: 10002,
           title: 'My Unsubmitted Course',
           school: 'University',
           term: 'Term',
           slug: 'University/Course2_(Term)',
           submitted: false,
           passcode: 'passcode',
           start: '2015-01-01'.to_date,
           end: '2020-01-01'.to_date)
    create(:courses_user,
           user_id: 100,
           course_id: 10002,
           role: 1)

    create(:campaign, id: 1, title: 'Fall 2015',
                      created_at: Time.now + 2.minutes)
    create(:campaign, id: 2, title: 'Spring 2016',
                      created_at: Time.now + 4.minutes)

    user = create(:admin,
                  id: 200,
                  wiki_token: 'foo',
                  wiki_secret: 'bar')
    login_as(user, scope: :user)
  end

  describe 'visiting the dashboard' do
    it 'should see submitted courses awaiting approval' 

  end

  describe 'adding a course to a campaign' do
    it 'should make the course live' 

  end

  describe 'removing all campaigns from a course' do
    it 'returns it to "submitted" status' 

  end

  describe 'adding a tag to a course' do
    it 'should work' 

  end

  describe 'linking a course to its Salesforce record' do
    it 'makes the Link to Salesforce button appear' 

  end

  after do
    logout
  end
end

