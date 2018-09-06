# frozen_string_literal: true

require 'rails_helper'

describe 'Surveys', type: :feature, js: true do
  include Rapidfire::QuestionSpecHelper
  include Rapidfire::AnswerSpecHelper

  before do
    include type: :feature
    include Devise::TestHelpers
    page.current_window.resize_to(1920, 1080)
  end

  describe 'Instructor takes survey' do
    before do
      @instructor = create(:user)
      @course = create(:course, title: 'My Active Course')
      article = create(:article)
      create(:articles_course, article_id: article.id, course_id: @course.id)

      @courses_user = create(
        :courses_user,
        user_id: @instructor.id,
        course_id: @course.id,
        role: 1
      )

      @survey = create(
        :survey,
        name: 'Instructor Survey',
        intro: 'Welcome to survey',
        thanks: 'You made it!',
        open: true
      )

      question_group = create(:question_group, id: 1, name: 'Basic Questions')
      @survey.rapidfire_question_groups << question_group
      @survey.save!

      # Q1
      # Matrix question at the start
      create(:matrix_question, question_text: 'first line', question_group_id: question_group.id)
      create(:matrix_question, question_text: 'second line', question_group_id: question_group.id)
      create(:matrix_question, question_text: 'third line', question_group_id: question_group.id)

      # Q2
      create(:q_checkbox, question_group_id: question_group.id, conditionals: '')

      # Q3
      q_radio = create(:q_radio, question_group_id: question_group.id,
                                 conditionals: '4|=|hindi|multi')
      q_radio.rules[:presence] = '0'
      q_radio.save!

      # Q4
      create(:q_long, question_group_id: question_group.id)

      # Q5
      q_select = create(:q_select, question_group_id: question_group.id)
      q_select.rules[:presence] = '0'
      q_select.follow_up_question_text = 'Anything else?'
      q_select.save!

      # Q6
      q_select2 = create(:q_select, question_group_id: question_group.id)
      q_select2.rules[:presence] = '0'
      q_select2.multiple = true
      q_select2.save!

      # Q7
      q_short = create(:q_short, question_group_id: question_group.id)
      q_short.rules[:presence] = '0'
      q_short.save!
      # Q8
      q_numeric = create(:q_numeric, question_group_id: question_group.id)
      q_numeric.rules[:maximum] = '500'
      q_numeric.rules[:minimum] = '1'
      q_numeric.save!

      create(:q_checkbox, question_group_id: question_group.id, answer_options: '',
                          course_data_type: 'Students')
      # Q9
      create(:q_checkbox, question_group_id: question_group.id, answer_options: '',
                          course_data_type: 'Articles')
      create(:q_checkbox, question_group_id: question_group.id, answer_options: '',
                          course_data_type: 'WikiEdu Staff')

      # Q10
      create(:q_rangeinput, question_group_id: question_group.id)

      # Q11 — this question will be removed because there are no WikiEdu staff
      # to select from for this course.
      q_select3 = create(:q_select, question_group_id: question_group.id,
                                    course_data_type: 'WikiEdu Staff')
      q_select3.rules[:presence] = '0'
      q_select3.answer_options = ''
      q_select3.save!

      # Matrix questions back-to-back, and matrix question at the end of survey
      # Q12
      create(:matrix_question, question_text: 'first line', question_group_id: question_group.id)
      create(:matrix_question, question_text: 'second line', question_group_id: question_group.id)
      create(:matrix_question, question_text: 'third line', question_group_id: question_group.id)
      # Q13
      create(:matrix_question2, question_text: 'first line', question_group_id: question_group.id)
      create(:matrix_question2, question_text: 'second line', question_group_id: question_group.id)
      create(:matrix_question2, question_text: 'third line', question_group_id: question_group.id)

      survey_assignment = create(
        :survey_assignment,
        survey_id: @survey.id
      )
      create(:survey_notification,
             course_id: @course.id,
             survey_assignment_id: survey_assignment.id,
             courses_users_id: @courses_user.id)
    end

    it 'sets the course and shows the progress bar' 


    it 'renders an optout page' 


    it 'navigates correctly between each question and submits' 


    it 'loads a question group preview' 

  end

  describe 'Permissions' do
    before do
      Capybara.current_driver = :poltergeist
    end

    before(:each) do
      @user = create(:user)
      @admin = create(:admin)

      @instructor = create(:user, username: 'Professor Sage')
      course = create(:course)

      @courses_user = create(
        :courses_user,
        user_id: @instructor.id,
        course_id: course.id,
        role: 1
      )

      @open_survey = create(:survey, open: true)

      @survey = create(:survey)

      survey_assignment = create(
        :survey_assignment,
        courses_user_role: 1,
        survey_id: @survey.id
      )
      create(:survey_notification,
             course_id: course.id,
             survey_assignment_id: survey_assignment.id,
             courses_users_id: @courses_user.id)
    end

    it 'can view survey if the survey notification id is associated with current user' 


    it 'can view survey if it is open' 


    it 'can view survey if user is an admin' 


    it 'redirects a user if not logged in or survey notification id isnt associated with them' 

  end

  after do
    logout
  end
end

