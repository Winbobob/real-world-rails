# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/surveys/survey_notifications_manager"

describe SurveyNotificationsManager do
  describe '.create_notifications' do
    include_context 'survey_assignment'

    it 'creates SurveyNotifications for each user ready for a survey' 


    it 'only creates notifications with unique user and survey combinations' 

  end
end

