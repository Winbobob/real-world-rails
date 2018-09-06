# frozen_string_literal: true

require 'rails_helper'

describe 'Instructor users', type: :feature, js: true do
  before do
    include type: :feature
    include Devise::TestHelpers
    page.current_window.resize_to(1920, 1080)
  end

  before :each do
    instructor = create(:user,
                        id: 100,
                        username: 'Professor Sage',
                        wiki_token: 'foo',
                        wiki_secret: 'bar')

    create(:user,
           id: 101,
           username: 'Student A')
    create(:user,
           id: 102,
           username: 'Student B')
    create(:course,
           id: 10001,
           title: 'My Active Course',
           school: 'University',
           term: 'Term',
           slug: 'University/Course_(Term)',
           submitted: true,
           passcode: 'passcode',
           start: '2015-01-01'.to_date,
           end: '2020-01-01'.to_date,
           user_count: 2,
           trained_count: 0)
    create(:courses_user,
           id: 1,
           user_id: 100,
           course_id: 10001,
           role: 1)
    create(:courses_user,
           id: 2,
           user_id: 101,
           course_id: 10001,
           role: 0)
    create(:courses_user,
           id: 3,
           user_id: 102,
           course_id: 10001,
           role: 0)
    create(:campaign,
           id: 1,
           title: 'Fall 2015')
    create(:campaigns_course,
           campaign_id: 1,
           course_id: 10001)

    login_as(instructor, scope: :user)
    stub_oauth_edit
    stub_raw_action
    stub_info_query
    stub_add_user_to_channel_success
  end

  describe 'visiting the students page' do
    let(:week) { create(:week, course_id: Course.first.id) }
    let(:tm) { TrainingModule.all.first }
    let!(:block) do
      create(:block, week_id: week.id, training_module_ids: [tm.id], due_date: Date.today)
    end

    before do
      TrainingModulesUsers.destroy_all
      Timecop.travel(1.year.from_now)
    end

    after do
      Timecop.return
    end

    it 'should be able to add students' 


    it 'should not be able to add nonexistent users as students' 


    it 'should be able to remove students' 


    it 'should be able to assign articles' 


    it 'should be able to remove students from the course' 


    it 'should be able to notify users with overdue training' 

  end

  after do
    logout
  end
end

