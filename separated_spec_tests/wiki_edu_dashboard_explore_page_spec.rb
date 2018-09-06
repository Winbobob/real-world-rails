# frozen_string_literal: true

require 'rails_helper'

describe 'the explore page', type: :feature, js: true do
  let(:campaign) { Campaign.default_campaign }
  let!(:course) do
    create(:course, start: '2014-01-01'.to_date,
                    end: Time.zone.today + 2.days)
  end
  let!(:campaign_course) do
    CampaignsCourses.create(campaign_id: campaign.id, course_id: course.id)
  end
  let!(:user) { create(:user, trained: true) }
  let!(:cu) do
    create(:courses_user,
           course_id: course.id,
           user_id: user.id,
           role: CoursesUsers::Roles::STUDENT_ROLE)
  end

  describe 'control bar' do
    it 'should allow sorting via dropdown' 

  end

  describe 'course list' do
    it 'should be sortable' 

  end

  describe 'rows' do
    it 'should allow navigation to a campaign page' 


    it 'should allow navigation to a course page' 


    it 'should show the stats accurately' 

  end
end

