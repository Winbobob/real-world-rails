# frozen_string_literal: true

require 'rails_helper'

describe 'Student users', type: :feature, js: true do
  before do
    include type: :feature
    include Devise::TestHelpers
    page.current_window.resize_to(1920, 1080)
  end

  let(:user) { create(:user, wiki_token: 'foo', wiki_secret: 'bar') }
  let!(:instructor) { create(:user, username: 'Professor Sage') }
  let!(:classmate) { create(:user, username: 'Classmate') }
  let!(:campaign) { create(:campaign) }
  let!(:course) do
    create(:course,
           title: 'An Example Course',
           school: 'University',
           term: 'Term',
           slug: 'University/An_Example_Course_(Term)',
           submitted: true,
           passcode: 'passcode',
           start: '2015-01-01'.to_date,
           end: '2020-01-01'.to_date)
  end
  let!(:editathon) do
    create(:editathon,
           title: 'An Example Editathon',
           school: 'University',
           term: 'Term',
           slug: 'University/An_Example_Editathon_(Term)',
           submitted: true,
           passcode: '',
           start: '2015-01-01'.to_date,
           end: '2020-01-01'.to_date)
  end

  before :each do
    create(:courses_user,
           user: instructor,
           course: course,
           role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
    create(:campaigns_course,
           campaign: campaign,
           course: course)
    create(:campaigns_course,
           campaign: campaign,
           course: editathon)
    create(:courses_user,
           user: classmate,
           course: course,
           role: CoursesUsers::Roles::STUDENT_ROLE)
    stub_add_user_to_channel_success
  end

  describe 'clicking log out' do
    it 'logs them out' 


    it 'does not cause problems if done twice' 

  end

  describe 'enrolling and unenrolling by button' do
    it 'joins and leaves a course' 


    it 'redirects to an error page if passcode is incorrect, with retry option' 


    it 'joins an Editathon without a passcode' 

  end

  describe 'visiting the ?enroll=passcode url' do
    it 'joins a course' 


    it 'works even if a student is not logged in' 


    it 'works even if a student has never logged in before' 


    it 'does not work if user is not persisted' 


    it 'redirects to a login error page if login fails' 

  end

  describe 'inputing an assigned article' do
    it 'assigns the article' 

  end

  describe 'inputing a reviewed article' do
    it 'assigns the review' 

  end

  describe 'clicking remove for an assigned article' do
    it 'removes the assignment' 

  end

  describe 'visiting the dashboard homepage' do
    it 'sees their course' 

  end
  after do
    logout
  end
end

