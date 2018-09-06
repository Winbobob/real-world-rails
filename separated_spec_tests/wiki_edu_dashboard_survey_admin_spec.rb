# frozen_string_literal: true

require 'rails_helper'

describe 'Survey Administration', type: :feature, js: true do
  include Rapidfire::QuestionSpecHelper
  include Rapidfire::AnswerSpecHelper

  before do
    include type: :feature
    include Devise::TestHelpers
    page.current_window.resize_to(1920, 1080)
  end

  context 'an admin' do
    before do
      admin = create(:admin)
      login_as admin
    end

    let(:instructor) { create(:user, email: 'instructor@school.edu') }

    before do
      course = create(:course)
      course.campaigns << Campaign.last
      course.courses_users << create(:courses_user, user_id: instructor.id, role: 1)
    end

    it 'can create a Survey and a SurveyAssignment' 


    it 'can view survey results' 


    it 'can delete a survey response' 

  end
end

