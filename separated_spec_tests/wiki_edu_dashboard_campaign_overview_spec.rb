# frozen_string_literal: true

require 'rails_helper'

campaign_course_count = 10

module ResetLocale
  RSpec.configuration.before do
    I18n.locale = 'en'
  end
end

describe 'campaign overview page', type: :feature, js: true do
  let(:slug)  { 'spring_2016' }
  let(:user)  { create(:user) }
  let(:campaign) do
    create(:campaign,
           title: 'Spring 2016 campaign',
           slug: slug,
           description: 'This is the best campaign')
  end

  describe 'header' do
    before do
      campaign_two = create(:campaign_two)

      (1..campaign_course_count).each do |i|
        course1 = create(:course,
                         id: i,
                         title: "course #{i}",
                         slug: "school/course_#{i}_(term)",
                         start: '2014-01-01'.to_date,
                         end: Time.zone.today + 2.days)
        course1.campaigns << campaign
        course2 = create(:course,
                         id: (i + campaign_course_count),
                         title: "course #{i + campaign_course_count}",
                         slug: "school/course_#{i + campaign_course_count}_(term)",
                         start: '2014-01-01'.to_date,
                         end: Time.zone.today + 2.days)
        course2.campaigns << campaign_two

        # STUDENTS, one per course
        create(:user, username: "user#{i}", id: i, trained: true)
        create(:courses_user,
               id: i,
               course_id: i,
               user_id: i,
               role: CoursesUsers::Roles::STUDENT_ROLE)

        # INSTRUCTORS, one per course
        create(:user, username: "instructor#{i}", id: i + campaign_course_count, trained: true)
        create(:courses_user,
               id: i + campaign_course_count,
               course_id: i,
               user_id: i + campaign_course_count,
               role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
        # The instructors are also enrolled as students.
        create(:courses_user,
               id: i + campaign_course_count * 2,
               course_id: i,
               user_id: i + campaign_course_count,
               role: CoursesUsers::Roles::STUDENT_ROLE)

        # article = create(:article,
        #                  id: i,
        #                  title: 'Selfie',
        #                  namespace: 0)
        # create(:articles_course,
        #        course_id: course1.id,
        #        article_id: article.id)
        # create(:revision,
        #        id: i,
        #        user_id: i,
        #        article_id: i,
        #        date: 6.days.ago,
        #        characters: 9000)
      end
      Course.update_all_caches
    end

    it 'should display stats accurately' 


    describe 'non-default locales' do
      include ResetLocale

      it 'should switch languages' 


      it 'falls back when locale is not available' 


      # TODO: Test somewhere that has access to the request.
      # it 'gets preferred language from header' do
      #   request.env['HTTP_ACCEPT_LANGUAGE'] = 'es-MX,fr'
      #   get ':index'
      #   expect(response).to have_content '10 Estudiantes'
      # end
    end
  end

  context 'as an user' do
    it 'should not show the edit buttons' 

  end

  context 'as a campaign organizer' do
    before do
      create(:campaigns_user, user_id: user.id, campaign_id: campaign.id,
                              role: CampaignsUsers::Roles::ORGANIZER_ROLE)
      login_as(user, scope: :user)
      visit "/campaigns/#{campaign.slug}/edit"
    end

    describe 'campaign description' do
      it 'shows the description input field when in edit mode' 


      it 'updates the campaign when you click save' 

    end

    describe 'campaign details' do
      it 'shows add organizers button and title field when in edit mode' 


      it 'updates the campaign when you click save' 


      it 'shows an error if you try to add a nonexistent user as an organizer' 


      context 'start and end dates' do
        it "hides the start and end dates unless the 'Use start and end dates' is checked" 


        it 'shows an error for invalid dates' 


        it 'updates the date fields properly, and unsets if #use_dates is unchecked' 

      end
    end

    describe 'campaign deletion' do
      it 'deletes the campaign when you click on delete' 


      it 'throws an error if you enter the wrong campaign title when trying to delete it' 

    end
  end
end

