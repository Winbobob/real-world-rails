# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/course_clone_manager"

describe CourseCloneManager do
  before do
    create(:course,
           id: 1,
           school: 'School',
           term: 'Term',
           title: 'Title',
           start: 1.year.ago,
           end: 8.months.ago,
           timeline_start: 11.months.ago,
           timeline_end: 9.months.ago,
           slug: 'School/Title_(Term)',
           passcode: 'code',
           flags: { first_flag: 'something' })
    create(:campaign, id: 1)
    create(:campaigns_course, course_id: 1, campaign_id: 1)
    create(:user, id: 1)
    create(:courses_user,
           user_id: 1,
           course_id: 1,
           role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
    create(:user, id: 2, username: 'user2')
    create(:courses_user,
           user_id: 2,
           course_id: 1,
           role: CoursesUsers::Roles::STUDENT_ROLE)
    create(:week, id: 1, course_id: 1, order: 1)
    create(:block,
           id: 1, week_id: 1, content: 'First Assignment',
           kind: 1, due_date: 10.months.ago, gradeable_id: 1)
    create(:week, id: 2, course_id: 1, order: 2)
    create(:week, id: 3, course_id: 1, order: 3)
    create(:gradeable,
           id: 1, gradeable_item_type: 'block',
           gradeable_item_id: 1, points: 15)
    create(:tag, course_id: 1, key: 'tricky_topic_areas', tag: 'no_medical_topics')
    create(:tag, course_id: 1, tag: 'arbitrary_tag')
  end

  let(:clone) { Course.last }
  let(:original) { Course.find(1) }
  let(:instructor) { User.find(1) }

  context 'newly cloned course' do
    before do
      CourseCloneManager.new(Course.find(1), User.find(1)).clone!
    end

    it 'has creating instructor carried over' 


    it 'does not carry over students' 


    it 'has a new passcode' 


    it 'does not carry over course dates' 


    it 'does not carry over campaigns (unless open_course_creation is enabled)' 


    it 'has weeks and block content from original' 


    it 'unsets block due dates' 


    it 'carries over gradeables as new records' 


    it 'adds tags new/returning and for cloned' 


    it 'carries over tricky_topic_areas tag, but not others' 


    it 'marks the cloned status as PENDING' 


    it 'does not carry over the course flags' 

  end

  context 'when open course creation is enabled' do
    before do
      allow(Features).to receive(:open_course_creation?).and_return(true)
      CourseCloneManager.new(Course.find(1), User.find(1)).clone!
    end

    it 'carries over campaigns' 

  end

  context 'when a course with the same temporary slug already exists' do
    before { CourseCloneManager.new(Course.find(1), User.find(1)).clone! }
    it 'returns the existing clone' 

  end

  context 'cloned LegacyCourse' do
    before do
      Course.find(1).update_attributes(type: 'LegacyCourse')
      CourseCloneManager.new(Course.find(1), User.find(1)).clone!
    end

    it 'sets the new course type to ClassroomProgramCourse' 

  end
end

